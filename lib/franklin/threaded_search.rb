require "franklin/search"
require "franklin/collate"

module Franklin
  class ThreadedSearch
    attr_accessor :searchers

    def initialize(libraries)
      @searchers = libraries.map { |library| Search.new(library) }
    end

    def perform(search_terms)
      threads = searchers.map { |search| Thread.new { search.perform(search_terms) } }
      threads.join
      Collate.new.perform(threads.map(&:value))
    end
  end
end
