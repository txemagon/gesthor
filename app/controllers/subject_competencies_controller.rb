class SubjectCompetenciesController < ApplicationController
  # GET /subject_competencies
  # GET /subject_competencies.json
  def index
    @subject_competencies = SubjectCompetency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subject_competencies }
    end
  end

  # GET /subject_competencies/1
  # GET /subject_competencies/1.json
  def show
    @subject_competency = SubjectCompetency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject_competency }
    end
  end

  # GET /subject_competencies/new
  # GET /subject_competencies/new.json
  def new
    @subject_competency = SubjectCompetency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject_competency }
    end
  end

  # GET /subject_competencies/1/edit
  def edit
    @subject_competency = SubjectCompetency.find(params[:id])
  end

  # POST /subject_competencies
  # POST /subject_competencies.json
  def create
    @subject_competency = SubjectCompetency.new(params[:subject_competency])

    respond_to do |format|
      if @subject_competency.save
        format.html { redirect_to @subject_competency, :notice => t('successfully_created', :model => t('SubjectCompetency.gender', :count => 1) )}
        format.json { render json: @subject_competency, status: :created, location: @subject_competency }
      else
        format.html { render action: "new" }
        format.json { render json: @subject_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subject_competencies/1
  # PUT /subject_competencies/1.json
  def update
    @subject_competency = SubjectCompetency.find(params[:id])

    respond_to do |format|
      if @subject_competency.update_attributes(params[:subject_competency])
        format.html { redirect_to @subject_competency, :notice => t('successfully_updated', :model => t('SubjectCompetency.gender', :count => 1) )}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_competencies/1
  # DELETE /subject_competencies/1.json
  def destroy
    @subject_competency = SubjectCompetency.find(params[:id])
    @subject_competency.destroy

    respond_to do |format|
      format.html { redirect_to subject_competencies_url }
      format.json { head :no_content }
    end
  end
end
