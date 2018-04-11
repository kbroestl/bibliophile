require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  let!(:book) { FactoryBot.create(:book) }
  let (:params) do { id: book.id } end

  describe "GET index" do
    it "renders the index template" do
      #get :index
      #expect(response).to render_template("index")
    end
  end
  describe "show" do
    it "retrieves the book record based on id" do
      # expect(Book).to receive(:find).with(book.id).and_return(book)
      get :show, params: { id: book.id }
      assert_response :success
    end
  end
end
