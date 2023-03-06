require "active_support/callbacks"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/object/blank"
require "tag_options/convert_key"
require "tag_options/hash_at"
require "tag_options/errors/not_hash_error"

module TagOptions
  class Hash < ActiveSupport::HashWithIndifferentAccess
    include ActiveSupport::Callbacks
    include ConvertKey

    define_callbacks :initialize

    def initialize(hash = {})
      run_callbacks :initialize do
        hash.each do |key, value|
          self[convert_key(key)] = value.is_a?(::Hash) ? self.class.new(value) : value.to_s
        end
        remove_blank!
      end
    end

    def at(key, *nested_keys, as: :default)
      TagOptions::HashAt.new(opt_hash: self, keys: [key, *nested_keys], as: as)
    end

    def dig(*keys)
      return self if keys.size.zero?

      dug_keys = []
      data = self
      keys.each_with_index do |key, index|
        key = convert_key(key)
        return nil unless data.key?(key)

        data = data[key]
        dug_keys << key
        last_key = index == keys.size - 1
        unless last_key || data.is_a?(self.class)
          raise TagOptions::Errors::NotHashError.new(dug_keys, type: data.class)
        end
      end
      data
    end

    def populate!(*keys)
      populated_keys = []
      data = self
      keys.each do |key|
        key = convert_key(key)
        data[key] ||= self.class.new
        data = data[key]
        populated_keys << key
        unless data.is_a?(self.class)
          raise TagOptions::Errors::NotHashError.new(populated_keys, type: data.class)
        end
      end
      self
    end

    def remove_blank!(hash = self, parent_hash: nil)
      hash.each do |key, value|
        if value.blank?
          hash.delete(key)
          remove_blank!(parent_hash) if parent_hash
        elsif value.is_a?(Hash)
          remove_blank!(value, parent_hash: hash)
          remove_blank!(parent_hash) if parent_hash
        end
      end
      hash
    end
  end
end
