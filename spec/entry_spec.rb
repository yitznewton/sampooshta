require 'rspec/its'
require 'date'
require 'gender'
require 'entry'

describe Entry do
  subject { described_class.from_string(line) }

  context 'with comma-delimited data' do
    context 'with female' do
      let(:line) { 'Kelly, Sue, Female, Pink, 7/12/1959' }

      its(:last_name) { is_expected.to eq 'Kelly' }
      its(:first_name) { is_expected.to eq 'Sue' }
      its(:middle_initial) { is_expected.to eq '' }
      its(:gender) { is_expected.to be_a Gender::Female }
      its(:favorite_color) { is_expected.to eq 'Pink' }
      its(:birth_date) { is_expected.to eq Date.parse('1959-07-12') }
    end

    context 'with male' do
      let(:line) { 'Abercrombie, Neil, Male, Tan, 2/13/1943' }

      its(:gender) { is_expected.to be_a Gender::Male }
    end

    context 'with unknown gender' do
      let(:line) { 'Kelly, Alex, Genderqueer, Pink, 7/12/1959' }

      it 'raises an error' do
        expect { subject.gender }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with pipe-delimited data' do
    context 'with female' do
      let(:line) { 'Bialik | Vardit | H | F | Orange | 8-2-1657' }

      its(:last_name) { is_expected.to eq 'Bialik' }
      its(:first_name) { is_expected.to eq 'Vardit' }
      its(:middle_initial) { is_expected.to eq 'H' }
      its(:gender) { is_expected.to be_a Gender::Female }
      its(:favorite_color) { is_expected.to eq 'Orange' }
      its(:birth_date) { is_expected.to eq Date.parse('1657-08-02') }
    end

    context 'with male' do
      let(:line) { 'Bonk | Radek | S | M | Green | 6-3-1975' }

      its(:gender) { is_expected.to be_a Gender::Male }
    end

    context 'with unknown gender' do
      let(:line) { 'Bonk | Radek | S | Q | Green | 6-3-1975' }

      it 'raises an error' do
        expect { subject.gender }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with space-delimited data' do
    context 'with female' do
      let(:line) { 'Hingis Martina M F 4-2-1979 Green' }

      its(:last_name) { is_expected.to eq 'Hingis' }
      its(:first_name) { is_expected.to eq 'Martina' }
      its(:middle_initial) { is_expected.to eq 'M' }
      its(:gender) { is_expected.to be_a Gender::Female }
      its(:favorite_color) { is_expected.to eq 'Green' }
      its(:birth_date) { is_expected.to eq Date.parse('1979-04-02') }
    end

    context 'with male' do
      let(:line) { 'Seles Morris H M 12-2-1973 Black' }

      its(:gender) { is_expected.to be_a Gender::Male }
    end

    context 'with unknown gender' do
      let(:line) { 'Seles Morris H Q 12-2-1973 Black' }

      it 'raises an error' do
        expect { subject.gender }.to raise_error(ArgumentError)
      end
    end
  end
end
