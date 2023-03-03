require "tag_options/hash"

RSpec.describe TagOptions::Hash do
  subject(:options) { described_class.new(hash) }

  let(:hash) do
    {
      name: "Exmaple",
      data: {controller: "dropdown"}
    }
  end

  def name_keyword(name: nil, **options)
    name
  end

  def other_options(name: nil, **options)
    options
  end

  it "properly passed a named keyword" do
    expect(name_keyword(**options)).to eq("Exmaple")
  end

  it "properly passes double splatted keywords" do
    expect(other_options(**options)).to include(data: {controller: "dropdown"})
  end
end
