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

  context "#at().combine!" do
    it "is expected to combine values on a root key" do
      options.at(:class).combine!("mr-1")
      expect(options[:class]).to include("ml-1", "mr-1")
    end

    it "is expected to populate values on a non-existant root key" do
      options.at(:html).combine!("mr-1")
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to combine values on a nested hash" do
      options.at(:data, :controller).combine!("toggle")
      expect(options.dig(:data, :controller)).to include("dropdown", "toggle")
    end

    it "is expected to raise an error if you combine values on a non-hash" do
      expect { options.at(:data, :controller, :dropdown).combine!("toggle") }
        .to raise_error(TagOptions::Errors::NotHashError)
    end

    it "is expect to populate values on a non-existant nested hash" do
      options.at(:form, :data, :controller).combine!("items--form")
      expect(options.dig(:form, :data, :controller)).to eq("items--form")
    end

    it "is expected to combine values on a root key with indifference" do
      options.at("class").combine!("mr-1")
      expect(options["class"]).to include("ml-1", "mr-1")
    end

    it "is expected to combine values on a nested hash with indifference" do
      options.at(:data, "controller").combine!("toggle")
      expect(options.dig("data", "controller")).to include("dropdown", "toggle")
    end

    it "is expected to combine values specified as arrays" do
      values = ["mt-1", "mx-2"]
      options.at(:class).combine!(values)
      expect(options[:class]).not_to include(values.to_s)
      expect(options[:class]).to include(*values)
    end
  end

  context "#at(as: :style).combine!" do
    it "is expected to combine html styles" do
      options.at(:style, as: :style).combine!("margin-right: 10px;")
      expect(options[:style]).to include("display: none;", "margin-right: 10px;")
    end

    it "is expected to populate existing html styles" do
      options.at(:style, as: :style).combine!("display: block;")
      expect(options[:style]).to eq("display: block;")
    end

    it "is expected to skip malformed styles" do
      options.at(:style, as: :style).combine!("display:")
      expect(options[:style]).to eq("display: none;")
    end
  end
end
