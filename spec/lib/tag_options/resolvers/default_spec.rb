require "tag_options/resolvers/default"

RSpec.describe TagOptions::Resolvers::Default do
  subject(:resolver) { described_class.new(*values) }

  let(:values) {
    ["ml-1 mr-1", "mt-2"]
  }

  describe "#values" do
    it "flattens and splits values", :aggregate_failures do
      expect(resolver.values).to be_a(Array)
      expect(resolver.values.size).to eq(3)
      expect(resolver.values).to include("ml-1", "mr-1", "mt-2")
    end
  end
end
