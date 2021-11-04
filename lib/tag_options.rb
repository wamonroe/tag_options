# frozen_string_literal: true

require 'tag_options/attribute_handler/base'
require 'tag_options/attribute_handler/generic'
require 'tag_options/attribute_handler/resolve_value'
require 'tag_options/attribute_handler/singular'
require 'tag_options/attribute_handler/style'
require 'tag_options/configuration'
require 'tag_options/hash'
require 'tag_options/railtie'
require 'tag_options/version'

module TagOptions
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= TagOptions::Configuration.new
    end

    def config
      yield(configuration)
    end
  end
end
