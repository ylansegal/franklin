require "franklin/version"
require "franklin/config"
require "franklin/threaded_search"
require "franklin/type_filter"
require "franklin/console_report"

module Franklin
  def run(search_terms, opts)
    config = Config.load_from_file(opts[:config_path])
    results = ThreadedSearch.new(config.libraries).perform(search_terms)
    filtered_results = TypeFilter.new(opts[:type]).perform(results)
    ConsoleReport.new(search_terms, filtered_results).print_to_out(opts[:out])
  end

  module_function :run
end
