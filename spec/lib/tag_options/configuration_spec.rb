require "tag_options/configuration"
require "tag_options/resolver"

class ExampleResolver < TagOptions::Resolver
  def call
  end
end

RSpec.describe TagOptions::Configuration do
  subject(:configuration) { described_class.new }

  describe "TagOptions#configure" do
    it "is expected to yield a TagOptions::Configuration instance" do
      expect { |b| TagOptions.configure(&b) }.to yield_control
    end
  end

  describe "#resolver" do
    it "is expected to raise an error if a resolver hasn't been registered" do
      expect { configuration.resolver(:not_registered) }.to raise_error(TagOptions::Errors::ResolverError)
    end
  end

  describe "#register_resolver" do
    it "is expected to allow you to register a resolver" do
      configuration.register_resolver :example, "ExampleResolver"
      expect { configuration.resolver(:example) }.not_to raise_error
    end
  end
end
