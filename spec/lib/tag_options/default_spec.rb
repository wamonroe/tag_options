require "tag_options/hash"

RSpec.describe TagOptions::Hash do
  subject { described_class.new(passed_options) }

  let(:passed_options) do
    {
      class: "ml-1",
      style: "display: none;",
      data: {controller: "dropdown", "dropdown-override-value": nil},
      disabled: false
    }
  end

  context "#at().default!" do
    it "is expected not to override an existing key" do
      options = subject.at(:class).default!("mr-1")
      expect(options[:class]).to eq("ml-1")
    end

    it "is expected to set a non-existing key" do
      options = subject.at(:role).default!("alert")
      expect(options[:role]).to eq("alert")
    end

    it "is expected to set a non-existing nested key" do
      options = subject.at(:data, :action).default!("dropdown#toggle")
      expect(options.dig(:data, :action)).to eq("dropdown#toggle")
    end

    it "is expected not to set an existing nested key" do
      options = subject.at(:data, :controller).default!("modal")
      expect(options.dig(:data, :controller)).to eq("dropdown")
    end

    it "is expected not to set an explicity defined false value" do
      options = subject.at(:disabled).default!(true)
      expect(options).to have_key(:disabled)
      expect(options[:disabled]).to be_falsey
    end

    it "is expected not to set an explicity defined nil value" do
      options = subject.at(:data, "dropdown-override-value").default!("blue")
      expect(options[:data]).to have_key("dropdown-override-value")
      expect(options.dig(:data, "dropdown-override-value")).to be_nil
    end
  end

  context "#at(as: :style).set!" do
    it "is expected not to change an existing style key" do
      options = subject.at(:style, as: :style).default!("color: red;")
      expect(options[:style]).to eq("display: none;")
    end

    context "with non-existing style" do
      let(:passed_options) { {} }

      it "is expected to set a non-existing style key" do
        options = subject.at(:style, as: :style).default!("color: red;")
        expect(options[:style]).to eq("color: red;")
      end
    end
  end
end
