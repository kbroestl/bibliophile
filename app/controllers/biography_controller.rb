# frozen_string_literal: true

class BiographyController < ApplicationController
  # GET /biographies is not a typical use case for this controller 

  # GET /biographies/1
  # GET /biographies/1.xml
  def show
    @bio = Biography.find(params[:id])
    @author = Author.find(@bio.author_id)
    @page_tite = 'Details for #{@author.name}'

    respond_to do |format|
      format.html
      format.xml { render xml: @bio }
    end
  end

  # GET /biographies/new is not a typical use case for this controller
  # biographies will be populated with content from wikipedia, confirmed by
  # user input as needed.
  #
  #GET /biographies/1/edit
  def edit
    @bio = Biography.find(params[:id])
  end

  # POST /biographies
  # POST /biographies.xml
  def create
    @bio = Biography.new(biography_params)

    respond_to do |format|
      if @bio.save
        flash[:notice] = 'Biography was succefully created'
        format.html { redirect_to(@bio) }
        format.xml { render xml: @bio, status: :created, location: @bio }
      else
        flash[:notice] = "Something's gone horribly wrong"
        format.html { render action: 'new' }
        format.xml  { render xml: @bio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /biographies/1
  # PUT /biographies/1.xml
  def update
    @bio = Biography.find(params[:id])

    respond_to do |format|
      if @bio.update_attributes(biography_params)
        flash[:notice] = 'Biography was successfully updated.'
        format.html { redirect_to(@author) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @author.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /biographies/1
  # DELETE /biographies/1.xml
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to(authors_url) }
      format.xml  { head :ok }
    end
  end

  private

  def biography_params
    params.require(:biography).permit(
      :image_url
    )
  end
end
