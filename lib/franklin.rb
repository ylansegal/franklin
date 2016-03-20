require "franklin/version"
require "franklin/config"
require "franklin/threaded_search"
require "franklin/console_report"

module Franklin
  def run(search_terms, opts)
    config = Config.load_from_file(opts[:config_path])
    results = ThreadedSearch.new(config.libraries).perform(search_terms)
    ConsoleReport.new(search_terms, results).print_to_out(opts[:out])
  end

  module_function :run
end
