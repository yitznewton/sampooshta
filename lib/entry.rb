require 'date'

class Entry
  GENDER_MALE = 0
  GENDER_FEMALE = 1

  def self.from_string(string)
    new(string)
  end

  def initialize(string)
    @string = string
  end

  def last_name
    segments[0]
  end

  def first_name
    segments[1]
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
