module Franklin
  class Collate
    def perform(search_results)
      items = Set.new(search_results.flat_map(&:keys))
      items.each_with_object({}) { |item, collation|
        collation[item] = search_results.map { |result| result[item] }.compact
      }
    end
  end
end
