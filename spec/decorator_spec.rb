require 'rspec/its'
require 'decorator'

describe Decorator do
  subject { described_class.new(entry) }

  let(:entry) { Entry.from_string('Seles Monica H F 4-2-1973 Black') }

  its(:last_name) { is_expected.to eq 'Seles' }
  its(:first_name) { is_expected.to eq 'Monica' }
  its(:middle_initial) { is_expected.to eq 'H' }
  its(:gender) { is_expected.to eq 'Female' }
  its(:favorite_color) { is_expected.to eq 'Black' }
  its(:birth_date) { is_expected.to eq '4/2/1973' }
end
