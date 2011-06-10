class BooksController < ApplicationController

  # GET /books
  # GET /books.xml
  def index
    @page_title = "Welcome"
    
    @books = Book.find_all_by_location_id(7)
    @unread = Book.count_unread
    @prolific_publishers = Book.find_most_prominent_publishers
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @books }
      format.json { render :json => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])
    @page_title = @book.title

    respond_to do |format|
      format.html
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @page_title = "Editing " + @book.title
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        flash[:notice] ="Something's gone horribly wrong."
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        flash[:notice] ="Something's gone horribly wrong."
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
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
    @page_title = "Unread Books"
    respond_to do |format|
      format.html
      format.xml  { render :xml => @books }
      format.json { render :json => @books }
    end
  end
    
end
