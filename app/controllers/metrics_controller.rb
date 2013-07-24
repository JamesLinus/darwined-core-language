class MetricsController < ApplicationController
  # GET /metrics
  # GET /metrics.json
  def index
    @metrics = Metric.all

    render json: @metrics
  end

  # GET /metrics/1
  # GET /metrics/1.json
  def show
    @metric = Metric.find(params[:id])

    render json: @metric
  end

  # POST /metrics
  # POST /metrics.json
  def create
    @metric = Metric.new(params[:metric])

    if @metric.save
      render json: @metric, status: :created, location: @metric
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /metrics/1
  # PATCH/PUT /metrics/1.json
  def update
    @metric = Metric.find(params[:id])

    if @metric.update(params[:metric])
      head :no_content
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /metrics/1
  # DELETE /metrics/1.json
  def destroy
    @metric = Metric.find(params[:id])
    @metric.destroy

    head :no_content
  end
end
