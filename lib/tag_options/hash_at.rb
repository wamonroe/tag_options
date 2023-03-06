require "tag_options/configuration"
require "tag_options/convert_key"

module TagOptions
  class HashAt
    include ConvertKey

    def initialize(opt_hash:, keys:, as:)
      @opt_hash = opt_hash
      @keys = keys[..-2].map { |key| convert_key(key) }
      @value_key = convert_key(keys[-1])
      @resolver = TagOptions.configuration.resolver(as)
    end

    def combine!(*values, **conditions)
      current_value = @opt_hash.dig(*@keys, @value_key)
      set_value! @resolver.call(current_value, *values, **conditions)
    end

    def default!(*values, **conditions)
      set_default! @resolver.call(*values, **conditions)
    end

    def set!(*values, **conditions)
      set_value! @resolver.call(*values, **conditions)
    end

    def remove!(*values, **conditions)
      regex_values, values = values.flatten.partition { |v| v.is_a?(Regexp) }
      remove_values!(*regex_values, *@resolver.values(*values, **conditions))
    end

    private

    def remove_values!(*values_to_remove)
      values = @resolver.values(@opt_hash.dig(*@keys)&.[](@value_key))
      values_to_remove.each do |value|
        if value.is_a?(Regexp)
          values.reject! { |current_value| value.match?(current_value) }
        else
          values.reject! { |current_value| value == current_value }
        end
      end
      @opt_hash.populate!(*@keys)
      @opt_hash.dig(*@keys)[@value_key] = @resolver.call(*values)
      @opt_hash.remove_blank!
      @opt_hash
    end

    def set_default!(value)
      return @opt_hash if value.blank?

      @opt_hash.populate!(*@keys)
      root = @opt_hash.dig(*@keys)
      root[@value_key] = value unless root.key?(@value_key)
      @opt_hash
    end

    def set_value!(value)
      return @opt_hash if value.blank?

      @opt_hash.populate!(*@keys)
      @opt_hash.dig(*@keys)[@value_key] = value
      @opt_hash
    end
  end
end
