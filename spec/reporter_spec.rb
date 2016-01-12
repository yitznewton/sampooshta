require 'rspec/its'
require 'entry'
require 'reporter'

describe Reporter do
  subject { described_class.call(entry) }

  let(:entry) { Entry.from_string('Seles Monica H F 4-2-1973 Black') }

  it 'contains fields in the desired order' do
    expect(subject).to eq 'Seles Monica Female 4/2/1973 Black'
  end
end
