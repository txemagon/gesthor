class EvaluationCriteriaController < ApplicationController
  # GET /evaluation_criteria
  # GET /evaluation_criteria.json
  def index
    @evaluation_criteria = EvaluationCriterium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluation_criteria }
    end
  end

  # GET /evaluation_criteria/1
  # GET /evaluation_criteria/1.json
  def show
    @evaluation_criterium = EvaluationCriterium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluation_criterium }
    end
  end

  # GET /evaluation_criteria/new
  # GET /evaluation_criteria/new.json
  def new
    @evaluation_criterium = EvaluationCriterium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluation_criterium }
    end
  end

  # GET /evaluation_criteria/1/edit
  def edit
    @evaluation_criterium = EvaluationCriterium.find(params[:id])
  end

  # POST /evaluation_criteria
  # POST /evaluation_criteria.json
  def create
    @evaluation_criterium = EvaluationCriterium.new(params[:evaluation_criterium])

    respond_to do |format|
      if @evaluation_criterium.save
        format.html { redirect_to @evaluation_criterium, notice: 'Evaluation criterium was successfully created.' }
        format.json { render json: @evaluation_criterium, status: :created, location: @evaluation_criterium }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluation_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluation_criteria/1
  # PUT /evaluation_criteria/1.json
  def update
    @evaluation_criterium = EvaluationCriterium.find(params[:id])

    respond_to do |format|
      if @evaluation_criterium.update_attributes(params[:evaluation_criterium])
        format.html { redirect_to @evaluation_criterium, notice: 'Evaluation criterium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluation_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_criteria/1
  # DELETE /evaluation_criteria/1.json
  def destroy
    @evaluation_criterium = EvaluationCriterium.find(params[:id])
    @evaluation_criterium.destroy

    respond_to do |format|
      format.html { redirect_to evaluation_criteria_url }
      format.json { head :no_content }
    end
  end
end
