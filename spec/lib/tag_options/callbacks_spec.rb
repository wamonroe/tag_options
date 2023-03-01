require "tag_options/hash"

class CustomTagOptionHash < TagOptions::Hash
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

RSpec.describe CustomTagOptionHash do
  subject { described_class.new({}) }

  it "executes defined before callback" do
    expect(subject[:before_key]).to be_truthy
  end

  it "executes defined after callback" do
    expect(subject[:after_key]).to be_truthy
  end

  it "executes defined around callback" do
    expect(subject[:around_key_1]).to be_truthy
    expect(subject[:around_key_2]).to be_truthy
  end
end
