# frozen_string_literal: true

TagOptions.configure do |config|
  # fallback_property_handler
  #
  # Defines the default behavior of how values are treated on HTML properties. `TagOptions::PropertyHandler::Generic`
  # allows for multiple, unique, values seperated by spaces.
  config.fallback_property_handler = 'TagOptions::PropertyHandler::Generic'

  # property_handlers
  #
  # Allows of the custom handling of HTML properties that match the defined property handler. Properties are handled by
  # the first matching property handler.
  config.property_handlers = [
    'TagOptions::PropertyHandler::Singular',
    'TagOptions::PropertyHandler::Style'
  ]
end
