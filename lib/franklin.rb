require "franklin/version"
require "franklin/config"
require "franklin/search"
require "franklin/collate"
require "franklin/console_report"

module Franklin
  def run(search_terms, out)
    config = Config.load_from_file
    individual_results = config.libraries.map { |library|
      Franklin::Search.new(library).perform("Forward The Foundation")
    }
    collated_results = Franklin::Collate.new.perform(individual_results)
    ConsoleReport.new(search_terms, collated_results).print_to_out(out)
  end

  module_function :run
end
