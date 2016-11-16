require "franklin/item"
require "franklin/availability"
require "mechanize"
require "json"

module Franklin
  class Search
    JS_VARIABLE = /window\.OverDrive\.mediaItems/

    def initialize(library)
      @library = library
    end

    def perform(search_term)
      results_page = search_library(search_term)
      results_json = extract_json(page: results_page)
      parse(json: results_json)
    end

    private

    attr_reader :library

    def search_library(search_term)
      prepare_form(search_term).submit
    end

    def prepare_form(search_term)
      ::Mechanize.new.get(library.url).form_with(action: "/search") { |form|
        form.query = search_term
      }
    end

    def extract_json(page:)
      script_tag = page.search("script").find { |script| script.text =~ JS_VARIABLE }
      var_assignment_line = script_tag.text.lines.find { |line| line =~ JS_VARIABLE }
      raw_javascript_object = var_assignment_line.scan(/{.*}/).first
      JSON.parse(raw_javascript_object)
    end

    def parse(json:)
      json.each_with_object({}) { |raw, result|
        id, data = raw
        result[parse_item(id: id, data: data)] = parse_availability(data: data)
      }
    end

    def parse_item(id:, data:)
      Item.new(id, data["title"], data["firstCreatorName"], data["type"]["name"])
    end

    def parse_availability(data:)
      Availability.new(library, data["ownedCopies"], data["availableCopies"], data["holdsCount"])
    end
  end
end
