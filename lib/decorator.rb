require 'forwardable'

class Decorator
  extend Forwardable

  def_delegators :entry,
    :last_name,
    :first_name,
    :middle_initial,
    :favorite_color

  def initialize(entry)
    @entry = entry
  end

  def gender
    entry.gender.to_s
  end

  def birth_date
    entry.birth_date.strftime('%-m/%-d/%Y')
  end

  private

  attr_reader :entry
end
