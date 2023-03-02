module TagOptions
  module ConvertKey
    def convert_key(key)
      key&.to_s&.to_sym
    end
  end
end
