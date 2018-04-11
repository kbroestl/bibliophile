require 'rails_helper'

RSpec.describe GenresController do
  # index fetch fails if the array is empty?
  #
  # Following does not work. (returns 10)
  before(:all) do
    @genres = 10.times do
      FactoryBot.create(:genre)
    end
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      # binding.pry

      expect(response).to render_template("index")
    end
  end
end
