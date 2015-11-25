module Franklin
  class AvailabilityDescription < SimpleDelegator
    def to_s
      "#{copies_information} @ #{library.name}"
    end

    private

    def copies_information
      available? ? "Available" : "#{copies_per_person} people/copy"
    end

    def available?
      available_copies > 0
    end

    def copies_per_person
      wait_list_size? ? (wait_list_size.to_f / total_copies.to_f).round(1) : "Unknown"
    end

    def wait_list_size?
      wait_list_size > 0
    end
  end
end
