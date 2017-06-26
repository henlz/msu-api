class WorkedDaysController < ApplicationController
  before_action :set_worked_day, only: [:show, :update, :destroy]

  # GET /worked_days
  def index
    @worked_days = WorkedDay.order(:week_number).paginate(:page => params[:page], :per_page => 10)
    render json: @worked_days,
           each_serializer: WorkedDaySerializer,
           meta: make_pagination_dict(@worked_days),
           meta_key: :pagination,
           root: :objects
  end

  # GET /worked_days/1
  def show
    render json: @worked_day
  end

  # POST /worked_days
  def create
    @worked_day = WorkedDay.new(worked_day_params)

    if not WorkedDay.valid_week_days.include? @worked_day.days

    end

    if @worked_day.save
      render json: @worked_day, status: :created, location: @worked_day
    else
      render json: @worked_day.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /worked_days/1
  def update
    if @worked_day.update(worked_day_params)
      render json: @worked_day
    else
      render json: @worked_day.errors, status: :unprocessable_entity
    end
  end

  # DELETE /worked_days/1
  def destroy
    @worked_day.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_worked_day
    @worked_day = WorkedDay.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def worked_day_params
    params.require(:worked_day).permit(:days, :salary, :extra, :deductions, :observations, :week_number, :employee_id)
  end
end
