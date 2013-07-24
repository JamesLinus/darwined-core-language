class RestrictionsController < ApplicationController
  # GET /restrictions
  # GET /restrictions.json
  def index
    @restrictions = Restriction.all

    render json: @restrictions
  end

  # GET /restrictions/1
  # GET /restrictions/1.json
  def show
    @restriction = Restriction.find(params[:id])

    render json: @restriction
  end

  # POST /restrictions
  # POST /restrictions.json
  def create
    @restriction = Restriction.new(params[:restriction])

    if @restriction.save
      render json: @restriction, status: :created, location: @restriction
    else
      render json: @restriction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restrictions/1
  # PATCH/PUT /restrictions/1.json
  def update
    @restriction = Restriction.find(params[:id])

    if @restriction.update(params[:restriction])
      head :no_content
    else
      render json: @restriction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restrictions/1
  # DELETE /restrictions/1.json
  def destroy
    @restriction = Restriction.find(params[:id])
    @restriction.destroy

    head :no_content
  end
end
