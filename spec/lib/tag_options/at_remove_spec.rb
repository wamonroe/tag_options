require "tag_options/hash"

RSpec.describe TagOptions::Hash do
  subject(:options) { described_class.new(hash) }

  let(:hash) do
    {
      class: "ml-1 mr-1",
      style: "display: none; color: red; background-color: white;",
      data: {controller: "dropdown transition"}
    }
  end

  context "#at().remove!" do
    it "is expected to remove a value" do
      options.at(:class).remove!("mr-1")
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to remove a value matching a regular expression" do
      options.at(:class).remove!(/\Amr-/)
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to do nothing if the value isn't there" do
      options.at(:class).remove!("mt-1")
      expect(options[:class]).to eq("ml-1 mr-1")
    end

    it "is expected to remove a nested value" do
      options.at(:data, :controller).remove!("transition")
      expect(options.dig(:data, :controller)).to eq("dropdown")
    end

    it "is expected to remove a nested value matching a regular expression" do
      options.at(:data, :controller).remove!(/sition\z/)
      expect(options.dig(:data, :controller)).to eq("dropdown")
    end
  end

  context "#at(as: :style).remove!" do
    it "is expected to remove a value" do
      options.at(:style, as: :style).remove!("color: red;")
      expect(options[:style]).to eq("display: none; background-color: white;")
    end

    it "is expected to remove a value matching a regular expression" do
      options.at(:style, as: :style).remove!(/color:/)
      expect(options[:style]).to eq("display: none;")
    end
  end
end
