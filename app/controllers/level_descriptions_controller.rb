class LevelDescriptionsController < ApplicationController
  # GET /level_descriptions
  # GET /level_descriptions.json
  def index
    @level_descriptions = LevelDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @level_descriptions }
    end
  end

  # GET /level_descriptions/1
  # GET /level_descriptions/1.json
  def show
    @level_description = LevelDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @level_description }
    end
  end

  # GET /level_descriptions/new
  # GET /level_descriptions/new.json
  def new
    @level_description = LevelDescription.new
    @level_description.training_level = TrainingLevel.find(params["training_level"])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @level_description }
    end
  end

  # GET /level_descriptions/1/edit
  def edit
    @level_description = LevelDescription.find(params[:id])
  end

  # POST /level_descriptions
  # POST /level_descriptions.json
  def create
    @level_description = LevelDescription.new(params[:level_description])

    respond_to do |format|
      if @level_description.save
        format.html { redirect_to @level_description, :notice => t('successfully_created', :model => t('LevelDescription.gender', :count => 1)) }
        format.json { render json: @level_description, status: :created, location: @level_description }
      else
        format.html { render action: "new" }
        format.json { render json: @level_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /level_descriptions/1
  # PUT /level_descriptions/1.json
  def update
    @level_description = LevelDescription.find(params[:id])

    respond_to do |format|
      if @level_description.update_attributes(params[:level_description])
        format.html { redirect_to @level_description, :notice  => t('successfully_updated', :model => t("level_description.gender", :count => 1)) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @level_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_descriptions/1
  # DELETE /level_descriptions/1.json
  def destroy
    @level_description = LevelDescription.find(params[:id])
    @level_description.destroy

    respond_to do |format|
      format.html { redirect_to level_descriptions_url }
      format.json { head :no_content }
    end
  end
end
