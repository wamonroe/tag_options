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

    def default!(*values, **conditions)
      @opt_hash.populate!(*@keys)
      set_default! @resolver.call(*values, **conditions)
    end

    def set!(*values, **conditions)
      @opt_hash.populate!(*@keys)
      set_value! @resolver.call(*values, **conditions)
    end

    private

    def set_default!(value)
      root = @opt_hash.dig(*@keys)
      root[@value_key] = value unless root.key?(@value_key)
      @opt_hash
    end

    def set_value!(value)
      @opt_hash.dig(*@keys)[@value_key] = value
      @opt_hash
    end
  end
end
