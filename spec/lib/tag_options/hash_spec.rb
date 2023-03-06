require "tag_options/hash"

RSpec.describe TagOptions::Hash do
  subject(:options) { described_class.new(hash) }

  let(:hash) {
    {
      empty_value_key: "",
      nil_value_key: nil,
      false_value_key: false,
      true_value_key: true,
      symbol_value_key: :symbol,
      number_value_key: 1
    }
  }

  context ".new" do
    it "is expected to remove keys assigned values that evaluate to blank strings" do
      expect(options).not_to have_key(:empty_value_key)
      expect(options).not_to have_key(:nil_value_key)
    end

    it "is expected to convert values to strings" do
      expect(options[:false_value_key]).to eq("false")
      expect(options[:true_value_key]).to eq("true")
      expect(options[:symbol_value_key]).to eq("symbol")
      expect(options[:number_value_key]).to eq("1")
    end
  end
end
