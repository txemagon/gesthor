class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    if (params["scope"])
      @roots = [TrainingLevel.find(params["scope"])]
    else
      @roots = TrainingLevel.roots
    end
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new
    @subject.training_level = TrainingLevel.find(params["training_level"]) if params["training_level"]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    competencies = params["subject"]["competency_ids"].map{ |el| el.to_i }
    params["subject"]["competency_ids"] = []
    @subject = Subject.new(params["subject"])

    respond_to do |format|
      if @subject.save
    competencies.each do |cid|
      SubjectCompetency.create( :subject_id => @subject.id, :competency_id => cid )
    end
        format.html { redirect_to @subject, :notice => t('successfully_created', :model => t('Subject.gender', :count => 1 ) ) }
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    params["subject"]["competency_ids"] ||= {}
    params["subject"]["qualification_ids"] ||= {}
    params["subject"]["level_goal_ids"] ||= {}
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to @subject, :notice => t('successfully_updated', :model => t('Subject.gender', :count => 1 ) ) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end
end
