require_relative 'decorator'

module Reporter
  OUTPUT_ATTRS = %i(last_name first_name gender birth_date favorite_color)

  def self.call(entry)
    decorator = Decorator.new(entry)
    data = OUTPUT_ATTRS.map { |f| decorator.send(f) }
    data.join(' ')
  end
end
