require "tag_options/resolvers/default"
require "tag_options/resolvers/style"
require "tag_options/errors/resolver_error"

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
    def initialize
      @resolvers = {
        default: "TagOptions::Resolvers::Default",
        style: "TagOptions::Resolvers::Style"
      }
    end

    def resolver(name)
      unless (resolver_name = @resolvers[name])
        raise TagOptions::Errors::ResolverError, name
      end
      Object.const_get(resolver_name)
    end

    def register_resolver(name, class_name)
      @resolvers[name] = class_name
    end
  end
end
