# frozen_string_literal: true

# The original code is from https://github.com/rubocop-hq/rubocop-rspec/blob/master/lib/rubocop/rspec/inject.rb
# See https://github.com/rubocop-hq/rubocop-rspec/blob/master/MIT-LICENSE.md
module RuboCop
  module Commsworld
    # Because RuboCop doesn't yet support plugins, we have to monkey patch in a
    # bit of our configuration.
    module Inject
      def self.defaults!
        inject! PROJECT_ROOT.join("config", "default.yml").to_s
      end

      def self.house_style!
        inject! PROJECT_ROOT.join("config", "house-style.yml").to_s
      end

      def self.inject!(path)
        hash = ConfigLoader.send(:load_yaml_configuration, path)
        config = Config.new(hash, path).tap(&:make_excludes_absolute)
        puts "configuration from #{path}" if ConfigLoader.debug?
        config = ConfigLoader.merge_with_default(config, path)
        ConfigLoader.instance_variable_set(:@default_configuration, config)
      end
    end
  end
end
