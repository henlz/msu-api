class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.paginate(:page => params[:page], :per_page => 10)
    render json: @employees,
           each_serializer: EmployeeSerializer,
           meta: make_pagination_dict(@employees),
           meta_key: :pagination,
           root: :objects
  end

  # GET /employees/1
  def show
    render json: @employee, serializer: nil
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def employee_params
    params.require(:employee).permit(:name, :role, :birth_date, :address, :ssn, :driver_license, :day_start_work)
  end
end
