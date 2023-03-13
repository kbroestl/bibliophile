# frozen_string_literal: true

class BooksController < ApplicationController
  # GET /books
  # GET /books.xml
  def index
    @page_title = 'Welcome'

    @results = Book.search(params[:search]).order('title') if params[:search]

    # @books = Book.find_all_by_location_id(7)
    @books = Book.find_in_process
    @unread = Book.count_unread
    @prolific_publishers = Book.find_most_prominent_publishers
    @last_read = Book.latest_readings
    @prolific_authors = Author.find_most_prominent_authors
    @lchart = Language.lchartstats

    respond_to do |format|
      format.html
      format.xml  { render xml: @books }
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])
    @page_title = @book.title

    respond_to do |format|
      format.html
      format.xml { render xml: @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html
      format.xml { render xml: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @page_title = 'Editing ' + @book.title
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render xml: @book, status: :created, location: @book }
      else
        flash[:notice] = "Something's gone horribly wrong."
        format.html { render action: 'new' }
        format.xml  { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update(book_params)
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        flash[:notice] = "Something's gone horribly wrong."
        format.html { render action: 'edit' }
        format.xml  { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  def unread
    @books = Book.unread_books
    @fruit = Book.low_hanging_fruit
    @page_title = 'Unread Books'
    respond_to do |format|
      format.html
      format.xml  { render xml: @books }
      format.json { render json: @books }
    end
  end

  private

  def book_params
    params.require(:book).permit(
      { author: %i[author_first author_last] },
      { authorship: %i[contributor editor translator] },
      :author_tokens,
      :title,
      :publisher,
      :ISBN,
      :genre_id,
      :location_id,
      :pages,
      :language_id,
      :notes,
      :excluded,
      :original_language
    )
  end
end
