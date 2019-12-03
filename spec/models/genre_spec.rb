# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe Genre, type: :model do
  let(:genre) { FactoryBot.create(:genre, genre: 'Nonsense') }
  let(:book) { FactoryBot.create(:book, title: 'Enigma', genre_id: genre.id) }

  it 'has a valid factory' do
    expect(FactoryBot.create(:genre)).to be_valid
  end

  describe 'Genres have members' do
    it 'returns a count of genre members' do
      expect(Genre.count(genre.id)).to eq(1)
    end
  end
end
