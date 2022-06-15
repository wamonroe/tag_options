require "tag_options/configuration"
require "tag_options/resolver"

class ExampleResolver < TagOptions::Resolver
  def call
  end
end

RSpec.describe TagOptions::Configuration do
  context "TagOptions#configure" do
    it "is expected to yield a TagOptions::Configuration instance" do
      expect { |b| TagOptions.configure(&b) }.to yield_control
    end
  end

  context "#resolver" do
    it "is expected to raise an error if a resolver hasn't been registered" do
      expect { subject.resolver(:not_registered) }.to raise_error(TagOptions::Errors::ResolverError)
    end
  end

  context "#register_resolver" do
    it "is expected to allow you to register a resolver" do
      subject.register_resolver :example, "ExampleResolver"
      expect { subject.resolver(:example) }.not_to raise_error
    end
  end
end
