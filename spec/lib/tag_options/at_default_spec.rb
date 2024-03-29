require "tag_options/hash"

RSpec.describe TagOptions::Hash do
  subject(:options) { described_class.new(hash) }

  let(:hash) do
    {
      class: "ml-1",
      style: "display: none;",
      data: {controller: "dropdown"}
    }
  end

  context "#at().default!" do
    it "is expected not to override an existing key" do
      options.at(:class).default!("mr-1")
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to set a non-existing key" do
      options.at(:role).default!("alert")
      expect(options[:role]).to eq("alert")
    end

    it "is expected to set a non-existing nested key" do
      options.at(:data, :action).default!("dropdown#toggle")
      expect(options.dig(:data, :action)).to eq("dropdown#toggle")
    end

    it "is expected not to set an existing nested key" do
      options.at(:data, :controller).default!("modal")
      expect(options.dig(:data, :controller)).to eq("dropdown")
    end

    it "is expected do nothing when no values are resolved on a non-existant root key" do
      options.at(:nonexistant).default!(conditional_value: false)
      expect(options).not_to have_key(:nonexistant)
    end

    it "is expected do nothing when no values are resolved on a non-existant nested hash" do
      options.at(:nonexistant, :nested).default!(conditional_value: false)
      expect(options).not_to have_key(:nonexistant)
    end
  end

  context "#at(as: :style).default!" do
    it "is expected not to change an existing style key" do
      options.at(:style, as: :style).default!("color: red;")
      expect(options[:style]).to eq("display: none;")
    end

    it "is expected to set a non-existing style key" do
      options.at(:nonexistant, as: :style).default!("color: red;")
      expect(options[:nonexistant]).to eq("color: red;")
    end

    it "is expected do nothing when no values are resolved on a non-existant root key" do
      options.at(:nonexistant, as: :style).default!("display: none;": false)
      expect(options).not_to have_key(:nonexistant)
    end

    it "is expected do nothing when no values are resolved on a non-existant nested hash" do
      options.at(:nonexistant, :nested, as: :style).default!("display: none;": false)
      expect(options).not_to have_key(:nonexistant)
    end
  end
end
