# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Language, type: :model do
	it 'has a valid factory' do
      expect(FactoryBot.create(:language)).to be_valid
	end

end