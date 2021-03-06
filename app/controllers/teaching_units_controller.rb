class TeachingUnitsController < ApplicationController
  # GET /teaching_units
  # GET /teaching_units.json
  def index
    @teaching_units = TeachingUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teaching_units }
    end
  end

  # GET /teaching_units/1
  # GET /teaching_units/1.json
  def show
    @teaching_unit = TeachingUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teaching_unit }
    end
  end

  # GET /teaching_units/new
  # GET /teaching_units/new.json
  def new
    @teaching_unit = TeachingUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teaching_unit }
    end
  end

  # GET /teaching_units/1/edit
  def edit
    @teaching_unit = TeachingUnit.find(params[:id])
  end

  # POST /teaching_units
  # POST /teaching_units.json
  def create
    @teaching_unit = TeachingUnit.new(params[:teaching_unit])

    respond_to do |format|
      if @teaching_unit.save
        format.html { redirect_to @teaching_unit, notice: 'Teaching unit was successfully created.' }
        format.json { render json: @teaching_unit, status: :created, location: @teaching_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @teaching_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teaching_units/1
  # PUT /teaching_units/1.json
  def update
    @teaching_unit = TeachingUnit.find(params[:id])

    respond_to do |format|
      if @teaching_unit.update_attributes(params[:teaching_unit])
        format.html { redirect_to @teaching_unit, notice: 'Teaching unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teaching_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_units/1
  # DELETE /teaching_units/1.json
  def destroy
    @teaching_unit = TeachingUnit.find(params[:id])
    @teaching_unit.destroy

    respond_to do |format|
      format.html { redirect_to teaching_units_url }
      format.json { head :no_content }
    end
  end
end
