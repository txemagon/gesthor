class LearningOutcomesController < ApplicationController
  # GET /learning_outcomes
  # GET /learning_outcomes.json
  def index
    if params[:subject]
      @subject = Subject.find(params[:subject])
      @learning_outcomes = @subject.learning_outcomes
    else
      @learning_outcomes = LearningOutcome.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @learning_outcomes }
    end
  end

  # GET /learning_outcomes/1
  # GET /learning_outcomes/1.json
  def show
    @learning_outcome = LearningOutcome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @learning_outcome }
    end
  end

  # GET /learning_outcomes/new
  # GET /learning_outcomes/new.json
  def new
    @learning_outcome = LearningOutcome.new
    @subject = Subject.find(params[:subject]) if params[:subject] 

    respond_to do |format|
      if @subject
        format.html # new.html.erb
        format.json { render json: @learning_outcome }
      else
        format.html { redirect_to training_levels_url, status: :bad_request }
        format.json { head :no_content }
      end
    end
  end

  # GET /learning_outcomes/1/edit
  def edit
    @learning_outcome = LearningOutcome.find(params[:id])
  end

  # POST /learning_outcomes
  # POST /learning_outcomes.json
  def create
    @learning_outcome = LearningOutcome.new(params[:learning_outcome])

    respond_to do |format|
      if @learning_outcome.save
        format.html { redirect_to @learning_outcome, :notice => t('successfully_created', :model => t('LearningOutcome.gender', :count => 1 ) ) }
        format.json { render json: @learning_outcome, :status => :created, location: @learning_outcome }
      else
        format.html { render action: "new" }
        format.json { render json: @learning_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /learning_outcomes/1
  # PUT /learning_outcomes/1.json
  def update
    @learning_outcome = LearningOutcome.find(params[:id])

    respond_to do |format|
      if @learning_outcome.update_attributes(params[:learning_outcome])
        format.html { redirect_to @learning_outcome, :notice => t('successfully_updated', :model => t('LearningOutcome.gender', :count => 1 ) ) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @learning_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_outcomes/1
  # DELETE /learning_outcomes/1.json
  def destroy
    @learning_outcome = LearningOutcome.find(params[:id])
    @learning_outcome.destroy

    respond_to do |format|
      format.html { redirect_to learning_outcomes_url }
      format.json { head :no_content }
    end
  end
end
