# frozen_string_literal: true

module TagOptions
  class Configuration
    def attribute_handlers
      @attribute_handlers ||= [
        'TagOptions::AttributeHandler::Singular',
        'TagOptions::AttributeHandler::Style'
      ]
    end

    def fallback_attribute_handler
      'TagOptions::AttributeHandler::Generic'
    end

    def attribute_handlers=(value)
      @attribute_handlers = Array(value)
    end
  end
end
