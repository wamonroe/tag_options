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

  context "#at().set!" do
    it "is expected to populate values on a root key" do
      options.at(:class).set!("mr-1")
      expect(options[:class]).to eq("mr-1")
    end

    it "is expected to populate values on a non-existant root key" do
      options.at(:html).set!("mr-1")
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to populate values on a nested hash" do
      options.at(:data, :controller).set!("toggle")
      expect(options.dig(:data, :controller)).to eq("toggle")
    end

    it "is expected to raise an error if you populate values on a non-hash" do
      expect { options.at(:data, :controller, :dropdown).set!("toggle") }
        .to raise_error(TagOptions::Errors::NotHashError)
    end

    it "is expect to populate values on a non-existant nested hash" do
      options.at(:form, :data, :controller).set!("items--form")
      expect(options.dig(:form, :data, :controller)).to eq("items--form")
    end

    it "is expected to populate values on a root key with indifference" do
      options.at("class").set!("mr-1")
      expect(options["class"]).to eq("mr-1")
    end

    it "is expected to populate values on a nested hash with indifference" do
      options.at(:data, "controller").set!("toggle")
      expect(options.dig("data", "controller")).to eq("toggle")
    end

    it "is expected to populate values specified as arrays" do
      values = ["mt-1", "mx-2"]
      options.at(:class).set!(values)
      expect(options[:class]).not_to include("ml-1")
      expect(options[:class]).not_to include(values.to_s)
      expect(options[:class]).to include(*values)
    end

    it "is expected do nothing when no values are resolved on a non-existant root key" do
      options.at(:nonexistant).set!(conditional_value: false)
      expect(options).not_to have_key(:nonexistant)
    end

    it "is expected do nothing when no values are resolved on a non-existant nested hash" do
      options.at(:nonexistant, :nested).set!(conditional_value: false)
      expect(options).not_to have_key(:nonexistant)
    end
  end

  context "#at(as: :style).set!" do
    it "is expected to populate html styles" do
      options.at(:style, as: :style).set!("margin-right: 10px;")
      expect(options[:style]).to eq("margin-right: 10px;")
    end

    it "is expected do nothing when no values are resolved on a non-existant root key" do
      options.at(:nonexistant, as: :style).set!("display: none;": false)
      expect(options).not_to have_key(:nonexistant)
    end

    it "is expected do nothing when no values are resolved on a non-existant nested hash" do
      options.at(:nonexistant, :nested, as: :style).set!("display: none;": false)
      expect(options).not_to have_key(:nonexistant)
    end
  end
end
