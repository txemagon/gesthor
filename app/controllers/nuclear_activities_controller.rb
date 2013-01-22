class NuclearActivitiesController < ApplicationController
  # GET /nuclear_activities
  # GET /nuclear_activities.json
  def index
    @nuclear_activities = NuclearActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nuclear_activities }
    end
  end

  # GET /nuclear_activities/1
  # GET /nuclear_activities/1.json
  def show
    @nuclear_activity = NuclearActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nuclear_activity }
    end
  end

  # GET /nuclear_activities/new
  # GET /nuclear_activities/new.json
  def new
    @nuclear_activity = NuclearActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nuclear_activity }
    end
  end

  # GET /nuclear_activities/1/edit
  def edit
    @nuclear_activity = NuclearActivity.find(params[:id])
  end

  # POST /nuclear_activities
  # POST /nuclear_activities.json
  def create
    @nuclear_activity = NuclearActivity.new(params[:nuclear_activity])

    respond_to do |format|
      if @nuclear_activity.save
        format.html { redirect_to @nuclear_activity, notice: 'Nuclear activity was successfully created.' }
        format.json { render json: @nuclear_activity, status: :created, location: @nuclear_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @nuclear_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nuclear_activities/1
  # PUT /nuclear_activities/1.json
  def update
    @nuclear_activity = NuclearActivity.find(params[:id])

    respond_to do |format|
      if @nuclear_activity.update_attributes(params[:nuclear_activity])
        format.html { redirect_to @nuclear_activity, notice: 'Nuclear activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nuclear_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuclear_activities/1
  # DELETE /nuclear_activities/1.json
  def destroy
    @nuclear_activity = NuclearActivity.find(params[:id])
    @nuclear_activity.destroy

    respond_to do |format|
      format.html { redirect_to nuclear_activities_url }
      format.json { head :no_content }
    end
  end
end
