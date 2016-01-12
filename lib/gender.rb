module Gender
  def self.from_string(string)
    case string[0].upcase
    when 'F'
      Female.new
    when 'M'
      Male.new
    else fail ArgumentError
    end
  end

  class Female
    def to_s
      'Female'
    end
  end

  class Male
    def to_s
      'Male'
    end
  end
end
