# frozen_string_literal: true

require 'rails/generators'

module TagOptions
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def copy_initializer
      copy_file 'tag_options.rb', 'config/initializers/tag_options.rb'
    end
  end
end
