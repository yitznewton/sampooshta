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
  end

  class Male
  end
end
