require "tag_options/resolvers/default"

RSpec.describe TagOptions::Resolvers::Style do
  subject(:resolver) { described_class.new(*values) }

  let(:values) {
    ["color:red;background-color: white;", " font-weight:  bold;"]
  }

  context "#values" do
    it "splits and flattens values" do
      expect(resolver.values).to be_a(Array)
      expect(resolver.values.size).to eq(3)
    end

    it "normalizes values" do
      expect(resolver.values).to be_a(Array)
      expect(resolver.values).to include("color: red;", "font-weight: bold;")
    end
  end
end
