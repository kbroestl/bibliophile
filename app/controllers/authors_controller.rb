# frozen_string_literal: true

class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.xml

  def index
    @authors = Author.where('name like ?', "%#{params[:q]}%").order(:author_last, :author_first)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @authors }
      format.json { render json: @authors.map(&:json_attributes) }
    end
  end

  # GET /authors/1
  # GET /authors/1.xml
  def show
    @author = Author.find(params[:id])
    @bio = Biography.fetch_bio(@author)
    @page_title = 'Details for ' + @author.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @author }
    end
  end

  # GET /authors/new
  # GET /authors/new.xml
  def new
    @author = Author.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @author }
      format.js
    end
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.xml
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        flash[:notice] = 'Author was successfully created.'
        format.html { redirect_to(@author) }
        format.xml  { render xml: @author, status: :created, location: @author }
        format.js { render action: 'show' }
      else
        flash[:notice] = "Something's gone horribly wrong."
        format.html { render action: 'new' }
        format.xml  { render xml: @author.errors, status: :unprocessable_entity }
        format.js { render action: 'new' }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.xml
  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update(author_params)
        flash[:notice] = 'Author was successfully updated.'
        format.html { redirect_to(@author) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.xml
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to(authors_url) }
      format.xml  { head :ok }
    end
  end

  private

  def author_params
    params.require(:author).permit(
      :author_first,
      :author_last
    )
  end
end
