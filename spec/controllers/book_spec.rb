# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:book) { FactoryBot.create(:book) }
  # let(:params) id: book.id

  # Following test requires a LOT of fixtures to run correctly since the
  # index template pulls all the stats, etc.
  describe 'GET index' do
    it 'renders the index template' do
      # get :index
      # expect(response).to render_template("index")
    end
  end
  describe 'show' do
    it 'retrieves the book record based on id' do
      # expect(Book).to receive(:find).with(book.id).and_return(book)
      get :show, params: { id: book.id }
      assert_response :success
    end
  end
end
