# frozen_string_literal: true

require 'active_support/core_ext/string'
require 'forwardable'

module TagOptions
  class Hash
    extend Forwardable

    def_delegators :@data, :inspect, :to_s, :stringify_keys, :<, :<=, :==, :>, :>=

    # Hashes passed into the initializer are automatically flattened, with nested keys seperated by dashes. For example,
    # `data: { controller: 'dropdown' }`` becomes `'data-controller': 'dropdown'`.
    def initialize(hash={})
      @data = {}
      flatten_hash(hash).each do |key, value|
        self[key] = value
      end
    end

    # []
    # Underscores in a key name is automatically coverted to dashes. Keys can be specified as strings or symbols, both
    # return the same value.
    def [](key)
      @data[normalize_key(key)]
    end

    # []=
    # Hashes assigned to a key are automatically flatten, with nested keys seperated by dashes. Underscores in a key
    # name is automatically converted to dashes. Keys can be specified as strings or symbols, both will assign the value
    # to the same key.
    def []=(key, value)
      if value.is_a?(::Hash)
        flatten_hash({ key => value }).each do |flat_key, flat_value|
          @data[normalize_key(flat_key)] = flat_value
        end
      else
        @data[normalize_key(key)] = value
      end
    end

    # combine_with!
    # Allows you to combine values with multiple HTML attributes in one operation. Passed keys should be the HTML
    # attributes to combine the values with. The values can be passed as single value (e.g. `class: 'flex'`) or as an
    # argument array (e.g. `class: ['flex', 'mt-2', 'flex-col':  layout_column?]`). Hashes in an argument array have
    # their keys combined only their value is true. Nested keys will automatically be flattened and combine with the
    # associated key (e.g. `data: { controller: 'dropdown' }` would be combined with `data-controller`).
    #
    #   #combine_with!(
    #     class: ['flex', 'mt-2', 'flex-col': layout_column?],
    #     data: {
    #       controller: ['dropdown', 'navbar': navbar?]
    #     }
    #   )
    #
    # TagOptions::Hash also responses to combine_with_<name>!, where `<name>` is the name of the HTML attribute to
    # combine the passed argument array with. If `<name>` is specified with a value containing underscores, the HTML
    # attribute is converted to dashes, for example: `combine_with_data_controller!` will result in the argument array
    # being combined with existing values in `data-controller`.
    def combine_with!(hash={})
      flatten_hash(hash).each do |key, args|
        self[key] = combine_values(self[key], *args)
      end
      self
    end

    # override!
    # Allows you to override values on multiple HTML attributes in one operation. Passed keys should be the HTML
    # attributes to override the values of. The values can be passed as single string (e.g. `class: 'flex'`) or as an
    # argument array (e.g. `class: ['flex', 'mt-2', 'flex-col':  layout_column?]`). Hashes in an argument array have
    # their keys added only if their value is true. Nested keys will automatically be flattened and override the value
    # at the associated key (e.g. `data: { controller: 'dropdown' }` would override values at `data-controller`).
    #
    #   #override!(
    #     class: ['flex', 'mt-2', 'flex-col': layout_column?],
    #     data: {
    #       controller: ['dropdown', 'navbar': navbar?]
    #     }
    #   )
    #
    # TagOptions::Hash also responses to override_<name>!, where `<name>` is the name of the HTML attribute to override
    # the passed argument array on. If `<name>` is specified with a value containing underscores, the resulting HTML
    # attribute is automatically nested, for example `override_data_controller!` will result in the argument array
    # overriding the existing values in `data-controller`.
    def override!(hash={})
      flatten_hash(hash).each do |key, args|
        self[key] = combine_values(*args)
      end
      self
    end

    def to_h
      @data.transform_values { |value| value.is_a?(::TagOptions::Hash) ? value.to_h : value }
    end
    alias to_hash to_h

  private

    def action_matcher
      /\A(?<action>combine_with|override)_(?<key>.*)!\z/
    end

    def combine_values(*values, **conditions)
      [*values, *resolve_conditions(conditions.to_h)].map { |v| v.to_s.split }.flatten.compact.uniq.join(' ')
    end

    def flatten_hash(hash)
      hash.each_with_object({}) do |(key, value), result|
        if value.is_a?(::Hash)
          flatten_hash(value).map do |nested_key, nested_value|
            result["#{key}-#{nested_key}".to_sym] = nested_value
          end
        else
          result[key] = value
        end
      end
    end

    def method_missing(method_name, *args, &block)
      match_data = action_matcher.match(method_name.to_s)
      if match_data
        public_send("#{match_data['action']}!", { match_data['key'] => args }, &block)
      else
        super
      end
    end

    def normalize_key(key)
      key.to_s.downcase.dasherize.to_sym
    end

    def resolve_conditions(conditions)
      conditions.select { |_key, value| value }.keys
    end

    def respond_to_missing?(method_name, include_private=false)
      action_matcher.match?(method_name.to_s) || super
    end
  end
end
