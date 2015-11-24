require "franklin/item"
require "franklin/availability"
require "mechanize"

module Franklin
  class Search
    def initialize(library)
      @library = library
    end

    def perform(search_term)
      results = search_library(search_term)
      parse_results(results)
    end

    private

    attr_reader :library

    def search_library(search_term)
      form = prepare_form(search_term)
      form.submit
    end

    def prepare_form(search_term)
      ::Mechanize.new.get(library.url).forms.first.tap { |form|
        form.FullTextCriteria = search_term
      }
    end

    def parse_results(results)
      results.search("div.containAll").each_with_object({}) { |container, result|
        result[parse_item(container)] = parse_availability(container)
      }
    end

    def parse_item(container)
      item_info = container.css("a.share-links").first.attributes
      id = item_info["data-sharecrid"].value
      title = item_info["data-sharetitle"].value
      author = item_info["data-sharecreator"].value

      format = container.css("span.tcc-icon-span").first.attributes["data-iconformat"].value

      Item.new(id, title, author, format)
    end

    def parse_availability(container)
      copies_info = container.css("div.img-and-info-contain.title-data").first.attributes

      total_copies = copies_info["data-copiestotal"].value
      available_copies = copies_info["data-copiesavail"].value
      wait_list_size = copies_info["data-numwaiting"].value

      Availability.new(library, total_copies, available_copies, wait_list_size)
    end
  end
end
