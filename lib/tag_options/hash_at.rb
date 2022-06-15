require "tag_options/configuration"

module TagOptions
  class HashAt
    def initialize(opt_hash:, keys:, as:)
      @opt_hash = opt_hash
      @keys = keys[..-2]
      @value_key = keys[-1]
      @resolver = TagOptions.configuration.resolver(as)
    end

    def combine!(*values, **conditions)
      @opt_hash.populate!(*@keys)
      current_value = @opt_hash.dig(*@keys, @value_key)
      set_value! @resolver.call(current_value, *values, **conditions)
    end

    def set!(*values, **conditions)
      @opt_hash.populate!(*@keys)
      set_value! @resolver.call(*values, **conditions)
    end

    private

    def set_value!(value)
      @opt_hash.dig(*@keys)[@value_key] = value
      @opt_hash
    end
  end
end
