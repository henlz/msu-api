class WorkedDaySerializer < ActiveModel::Serializer
  attributes :id, :salary, :employee_name, :days, :week_number

  def employee_name
    object.employee.name
  end
end