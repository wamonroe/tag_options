module TagOptions
  class Resolver
    def initialize(*values, **conditional_values)
      @values = [*values.flatten, *resolve_conditional_values(conditional_values)]
    end

    def self.call(...)
      new(...).call
    end

    private

    def resolve_conditional_values(conditional_values)
      conditional_values.select { |_key, value| value }.keys
    end
  end
end
