require 'date'

class Entry
  GENDER_MALE = 0
  GENDER_FEMALE = 1

  def self.from_string(string)
    if string.include?(',')
      CommaDelimited.new(string)
    else
      PipeDelimited.new(string)
    end
  end

  class CommaDelimited
    def initialize(string)
      @string = string
    end

    def last_name
      segments[0]
    end

    def first_name
      segments[1]
    end

    def middle_initial
      ''
    end

    def gender
      case segments[2]
      when 'Male'
        GENDER_MALE
      when 'Female'
        GENDER_FEMALE
      else fail ArgumentError
      end
    end

    def birth_date
      Date.strptime(segments[4], '%m/%d/%Y')
    end

    def favorite_color
      segments[3]
    end

    private

    attr_reader :string

    def segments
      string.split(', ')
    end
  end

  class PipeDelimited
    def initialize(string)
      @string = string
    end
    
    def last_name
      segments[0]
    end

    def first_name
      segments[1]
    end

    def middle_initial
      segments[2]
    end

    def gender
      case segments[3]
      when 'F'
        GENDER_FEMALE
      when 'M'
        GENDER_MALE
      else fail ArgumentError
      end
    end

    def favorite_color
      segments[4]
    end

    def birth_date
      Date.strptime(segments[5], '%m-%d-%Y')
    end

    private

    attr_reader :string

    def segments
      string.split(' | ')
    end
  end
end
