require "erb"
require "franklin/availability_description"

module Franklin
  class ConsoleReport
    def initialize(search_terms, collated_results)
      @search_terms = search_terms
      @collated_results = collated_results
    end

    def print_to_out(io)
      io.tap { |out|
        out.puts template.result(binding)
      }
    end

    private

    attr_reader :search_terms, :collated_results

    def template
      @template ||= ERB.new(template_source_file, safe_level, trim_value)
    end

    def template_source_file
      File.read(File.join(__dir__, "templates", "console_report.erb"))
    end

    def safe_level
      nil
    end

    def trim_value
      "-"
    end
  end
end
