require "franklin/version"
require "franklin/config"
require "franklin/threaded_search"
require "franklin/type_filter"
require "franklin/console_report"

module Franklin
  def run(search_terms, config_path: nil, type: nil, out:)
    config = Config.load_from_file(config_path)
    results = ThreadedSearch.new(config.libraries).perform(search_terms)
    filtered_results = TypeFilter.new(type || config.default_type).perform(results)
    ConsoleReport.new(search_terms, filtered_results).print_to_out(out)
  end

  module_function :run
end
