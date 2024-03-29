# frozen_string_literal: true

class LanguagesController < ApplicationController
  # GET /languages
  # GET /languages.xml
  def index
    @languages = Language.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @languages }
    end
  end

  # GET /languages/1
  # GET /languages/1.xml
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.xml
  def new
    @language = Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Language.find(params[:id])
  end

  # POST /languages
  # POST /languages.xml
  def create
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        flash[:notice] = 'Language was successfully created.'
        format.html { redirect_to(@language) }
        format.xml  { render xml: @language, status: :created, location: @language }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.xml
  def update
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update(language_params)
        flash[:notice] = 'Language was successfully updated.'
        format.html { redirect_to(@language) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.xml
  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to(languages_url) }
      format.xml  { head :ok }
    end
  end

  def languageschart
    @languages = Language.lchartstats
    respond_to do |format|
      format.json { render json: @languages }
      format.xml { render xml: @languages }
    end
  end

  private
    
  def language_params
    params.require(:language).permit(
      :name
    )
  end
end
