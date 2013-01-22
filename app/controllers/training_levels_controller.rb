class TrainingLevelsController < ApplicationController
  # GET /training_levels
  # GET /training_levels.json
  def index
    @training_levels = TrainingLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @training_levels }
    end
  end

  # GET /training_levels/1
  # GET /training_levels/1.json
  def show
    @training_level = TrainingLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @training_level }
    end
  end

  # GET /training_levels/new
  # GET /training_levels/new.json
  def new
    @training_level = TrainingLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training_level }
    end
  end

  # GET /training_levels/1/edit
  def edit
    @training_level = TrainingLevel.find(params[:id])
  end

  # POST /training_levels
  # POST /training_levels.json
  def create
    @training_level = TrainingLevel.new(params[:training_level])

    respond_to do |format|
      if @training_level.save
        format.html { redirect_to @training_level,  :notice => t('successfully_created', :model => t('training_level.gender', :count => 1) ) }
        format.json { render json: @training_level, status: :created, location: @training_level }
      else
        format.html { render action: "new" }
        format.json { render json: @training_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /training_levels/1
  # PUT /training_levels/1.json
  def update
    @training_level = TrainingLevel.find(params[:id])

    respond_to do |format|
      if @training_level.update_attributes(params[:training_level])
        format.html { redirect_to @training_level, :notice => t('successfully_updated', :model => t('training_level.gender', :count => 1) ) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_levels/1
  # DELETE /training_levels/1.json
  def destroy
    @training_level = TrainingLevel.find(params[:id])
    @training_level.destroy

    respond_to do |format|
      format.html { redirect_to training_levels_url }
      format.json { head :no_content }
    end
  end
end
