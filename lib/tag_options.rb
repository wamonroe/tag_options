require "tag_options/hash"
require "tag_options/version"

module TagOptions
  def self.Hash(hash = {})
    TagOptions::Hash.new(hash)
  end
end
