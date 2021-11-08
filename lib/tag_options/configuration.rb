# frozen_string_literal: true

module TagOptions
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= TagOptions::Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Configuration
    attr_writer :fallback_property_handler, :property_handlers

    def fallback_property_handler
      @fallback_property_handler ||= 'TagOptions::PropertyHandler::Generic'
    end

    def property_handlers
      @property_handlers ||= [
        'TagOptions::PropertyHandler::Singular',
        'TagOptions::PropertyHandler::Style'
      ]
    end
  end
end
