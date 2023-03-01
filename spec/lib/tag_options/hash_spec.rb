require "tag_options/hash"

RSpec.describe TagOptions::Hash do
  subject { described_class.new(passed_options) }

  let(:passed_options) do
    {
      class: "ml-1",
      style: "display: none;",
      data: {controller: "dropdown"}
    }
  end

  context "#at().combine!" do
    it "is expected to combine values on a root key" do
      options = subject.at(:class).combine!("mr-1")
      expect(options[:class]).to be_a(String)
      expect(options[:class]).to include("ml-1", "mr-1")
    end

    it "is expected to populate values on a non-existant root key" do
      options = subject.at(:html).combine!("mr-1")
      expect(options[:class]).to be_a(String)
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to combine values on a nested hash" do
      options = subject.at(:data, :controller).combine!("toggle")
      expect(options.dig(:data, :controller)).to be_a(String)
      expect(options.dig(:data, :controller)).to include("dropdown", "toggle")
    end

    it "is expected to raise an error if you combine values on a non-hash" do
      expect { subject.at(:data, :controller, :dropdown).combine!("toggle") }
        .to raise_error(TagOptions::Errors::NotHashError)
    end

    it "is expect to populate values on a non-existant nested hash" do
      options = subject.at(:form, :data, :controller).combine!("items--form")
      expect(options.dig(:form, :data, :controller)).to eq("items--form")
    end

    it "is expected to combine values on a root key with indifference" do
      options = subject.at("class").combine!("mr-1")
      expect(options["class"]).to be_a(String)
      expect(options["class"]).to include("ml-1", "mr-1")
    end

    it "is expected to combine values on a nested hash with indifference" do
      options = subject.at(:data, "controller").combine!("toggle")
      expect(options.dig("data", :controller)).to be_a(String)
      expect(options.dig("data", "controller")).to include("dropdown", "toggle")
    end
  end

  context "#at().set!" do
    it "is expected to populate values on a root key" do
      options = subject.at(:class).set!("mr-1")
      expect(options[:class]).to be_a(String)
      expect(options[:class]).to eq("mr-1")
    end

    it "is expected to populate values on a non-existant root key" do
      options = subject.at(:html).set!("mr-1")
      expect(options[:class]).to be_a(String)
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to populate values on a nested hash" do
      options = subject.at(:data, :controller).set!("toggle")
      expect(options.dig(:data, :controller)).to be_a(String)
      expect(options.dig(:data, :controller)).to eq("toggle")
    end

    it "is expected to raise an error if you populate values on a non-hash" do
      expect { subject.at(:data, :controller, :dropdown).set!("toggle") }
        .to raise_error(TagOptions::Errors::NotHashError)
    end

    it "is expect to populate values on a non-existant nested hash" do
      options = subject.at(:form, :data, :controller).set!("items--form")
      expect(options.dig(:form, :data, :controller)).to eq("items--form")
    end

    it "is expected to populate values on a root key with indifference" do
      options = subject.at("class").set!("mr-1")
      expect(options["class"]).to be_a(String)
      expect(options["class"]).to eq("mr-1")
    end

    it "is expected to populate values on a nested hash with indifference" do
      options = subject.at(:data, "controller").set!("toggle")
      expect(options.dig("data", :controller)).to be_a(String)
      expect(options.dig("data", "controller")).to eq("toggle")
    end
  end

  context "#at(as: :style).combine!" do
    it "is expected to combine html styles" do
      options = subject.at(:style, as: :style).combine!("margin-right: 10px;")
      expect(options[:style]).to include("display: none;", "margin-right: 10px;")
    end

    it "is expected to populate existing html styles" do
      options = subject.at(:style, as: :style).combine!("display: block;")
      expect(options[:style]).to eq("display: block;")
    end

    it "is expected to skip malformed styles" do
      options = subject.at(:style, as: :style).combine!("display:")
      expect(options[:style]).to eq("display: none;")
    end
  end

  context "#at(as: :style).set!" do
    it "is expected to populate html styles" do
      options = subject.at(:style, as: :style).set!("margin-right: 10px;")
      expect(options[:style]).to eq("margin-right: 10px;")
    end
  end
end
