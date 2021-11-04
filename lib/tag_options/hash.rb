# frozen_string_literal: true

require 'active_support/core_ext/string'
require 'forwardable'
require 'tag_options/attribute_handler/resolve_value'
module TagOptions
  class Hash
    extend Forwardable

    def_delegators :@data, :inspect, :to_s, :stringify_keys, :<, :<=, :==, :>, :>=

    # Hashes passed into the initializer are automatically flattened, with nested keys seperated by dashes. For example,
    # `data: { controller: 'dropdown' }`` becomes `'data-controller': 'dropdown'`.
    def initialize(hash={})
      @data = {}
      flatten_hash(hash).each do |property, value|
        self[property] = value
      end
    end

    # []
    # Underscores in a property name is automatically coverted to dashes. Properties can be specified as strings or
    # symbols, both return the same value.
    def [](property)
      @data[normalize_property(property)]
    end

    # []=
    # Hashes assigned to a property are automatically flatten, with nested keys seperated by dashes. Underscores in a
    # property name are automatically converted to dashes. Propertiess can be specified as strings or symbols, both will
    # assign the value to the same property.
    def []=(property, value)
      if value.is_a?(::Hash)
        flatten_hash({ property => value }).each do |flat_property, flat_value|
          store(flat_property, flat_value)
        end
      else
        store(property, value)
      end
    end

    # combine_with!
    # Allows you to combine values with multiple HTML attributes in one operation. Passed keys should be the HTML
    # property to combine the values with. The values can be specified as single string (e.g. `class: 'flex'`) or as an
    # argument array (e.g. `class: ['flex', 'mt-2', 'flex-col':  layout_column?]`). Hashes in an argument array have
    # their keys combined only their value is true. Nested keys will automatically be flattened and combine with the
    # associated property (e.g. `data: { controller: 'dropdown' }` would be combined with `data-controller`).
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
      flatten_hash(hash).each do |property, args|
        store(property, self[property], *args)
      end
      self
    end

    # override!
    # Allows you to override values on multiple HTML properties in one operation. Passed keys should be the HTML
    # properties to override the values of. The values can be passed as single string (e.g. `class: 'flex'`) or as an
    # argument array (e.g. `class: ['flex', 'mt-2', 'flex-col':  layout_column?]`). Hashes in an argument array have
    # their keys added only if their value is true. Nested keys will automatically be flattened and override the value
    # at the associated property (e.g. `data: { controller: 'dropdown' }` would override values at `data-controller`).
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
      flatten_hash(hash).each do |property, args|
        store(property, *args)
      end
      self
    end

    def to_h
      @data.transform_values { |value| value.is_a?(::TagOptions::Hash) ? value.to_h : value }
    end
    alias to_hash to_h

  private

    def action_matcher
      /\A(?<action>combine_with|override)_(?<property>.*)!\z/
    end

    def flatten_hash(hash)
      hash.each_with_object({}) do |(property, value), result|
        if value.is_a?(::Hash)
          flatten_hash(value).map do |nested_property, nested_value|
            result["#{property}-#{nested_property}".to_sym] = nested_value
          end
        else
          result[property] = value
        end
      end
    end

    def method_missing(method_name, *args, &block)
      match_data = action_matcher.match(method_name.to_s)
      if match_data
        public_send("#{match_data['action']}!", { match_data['property'] => args }, &block)
      else
        super
      end
    end

    def store(property, *values, **conditions)
      property = normalize_property(property)
      value = resolve_value(property, *values, **conditions)
      value.empty? ? @data.delete(property) : @data[property] = value
    end

    def resolve_value(property, *values, **conditions)
      TagOptions::AttributeHandler::ResolveValue.call(property, *values, **conditions)
    end

    def normalize_property(property)
      property.to_s.downcase.dasherize.to_sym
    end

    def respond_to_missing?(method_name, include_private=false)
      action_matcher.match?(method_name.to_s) || super
    end
  end
end
