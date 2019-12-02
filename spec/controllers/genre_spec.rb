# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenresController do
  # This creates 10 genres every time the test suite runs and without something
  # like database cleaner breaks genre model tests later
  # before(:all) do
  #   @genres = 10.times do
  #     FactoryBot.create(:genre)
  #   end
  # end

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
