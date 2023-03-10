# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe Location, type: :model do
  let(:location) { FactoryBot.create(:location, name: 'Limbo') }
  let :book do
    FactoryBot.create(:book,
                      title: 'Enigma',
                      location_id: location.id)
  end

  it 'has a valid factory' do
    expect(FactoryBot.create(:location)).to be_valid
  end

  describe 'Locations have members' do
    it 'returns a count of location members' do
      expect(Location.count(location.id)).to eq(1)
    end
  end
end
