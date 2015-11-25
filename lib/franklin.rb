require "franklin/version"
require "franklin/config"
require "franklin/threaded_search"
require "franklin/console_report"

module Franklin
  def run(search_terms, out)
    config = Config.load_from_file
    results = ThreadedSearch.new(config.libraries).perform(search_terms)
    ConsoleReport.new(search_terms, results).print_to_out(out)
  end

  module_function :run
end
