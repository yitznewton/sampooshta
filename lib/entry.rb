require 'date'
require_relative 'gender'

class Entry
  def self.from_string(string)
    if string.include?(',')
      CommaDelimited.new(string)
    elsif string.include?('|')
      PipeDelimited.new(string)
    else
      SpaceDelimited.new(string)
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
      Gender.from_string(segments[2])
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
      Gender.from_string(segments[3])
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

  class SpaceDelimited
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
      Gender.from_string(segments[3])
    end

    def favorite_color
      segments[5]
    end

    def birth_date
      Date.strptime(segments[4], '%m-%d-%Y')
    end

    private

    attr_reader :string

    def segments
      string.split(' ')
    end
  end
end
