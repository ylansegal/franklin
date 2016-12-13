module Franklin
  class TypeFilter
    def initialize(type)
      @type = type
    end

    def perform(results)
      return results unless type
      results.dup.keep_if { |item, _availability| item.format.casecmp(type).zero? }
    end

    private

    attr_reader :type
  end
end
