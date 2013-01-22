class EvaluableCompetenciesController < ApplicationController
  # GET /evaluable_competencies
  # GET /evaluable_competencies.json
  def index
    @evaluable_competencies = EvaluableCompetency.all(:order => 'category')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluable_competencies }
    end
  end

  # GET /evaluable_competencies/1
  # GET /evaluable_competencies/1.json
  def show
    @evaluable_competency = EvaluableCompetency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluable_competency }
    end
  end

  # GET /evaluable_competencies/new
  # GET /evaluable_competencies/new.json
  def new
    @evaluable_competency = EvaluableCompetency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluable_competency }
    end
  end

  # GET /evaluable_competencies/1/edit
  def edit
    @evaluable_competency = EvaluableCompetency.find(params[:id])
  end

  # POST /evaluable_competencies
  # POST /evaluable_competencies.json
  def create
    @evaluable_competency = EvaluableCompetency.new(params[:evaluable_competency])

    respond_to do |format|
      if @evaluable_competency.save
        format.html { redirect_to @evaluable_competency, :notice => t('successfully_created', :model => t('EvalubleCompetency.gender', :count => 1)) }
        format.json { render json: @evaluable_competency, status: :created, location: @evaluable_competency }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluable_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluable_competencies/1
  # PUT /evaluable_competencies/1.json
  def update
    @evaluable_competency = EvaluableCompetency.find(params[:id])

    respond_to do |format|
      if @evaluable_competency.update_attributes(params[:evaluable_competency])
        format.html { redirect_to @evaluable_competency, :notice => t('successfully_updated', :model => t('EvaluableCompetency.gender', :count => 1)) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluable_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluable_competencies/1
  # DELETE /evaluable_competencies/1.json
  def destroy
    @evaluable_competency = EvaluableCompetency.find(params[:id])
    @evaluable_competency.destroy

    respond_to do |format|
      format.html { redirect_to evaluable_competencies_url }
      format.json { head :no_content }
    end
  end
end
