module ObjectMapping
  def self.encode_objects
    raise NotImplementedError
  end

  def self.decode_objects
    raise NotImplementedError
  end

  def self.convert
    raise NotImplementedError
  end
end
