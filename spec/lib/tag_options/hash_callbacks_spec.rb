require "tag_options/hash"

class HashCallback < TagOptions::Hash
  set_callback :initialize, :before do |object|
    object[:before_key] = true
  end

  set_callback :initialize, :after do |object|
    object[:after_key] = true
  end

  set_callback :initialize, :around do |object, block|
    object[:around_key_1] = true
    block&.call
    object[:around_key_2] = true
  end
end

RSpec.describe HashCallback do
  subject(:hash) { described_class.new({}) }

  it "executes defined before callback" do
    expect(hash[:before_key]).to be_truthy
  end

  it "executes defined after callback" do
    expect(hash[:after_key]).to be_truthy
  end

  it "executes defined around callback", :aggregate_failures do
    expect(hash[:around_key_1]).to be_truthy
    expect(hash[:around_key_2]).to be_truthy
  end
end
