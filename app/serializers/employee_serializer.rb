class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :role, :salary, :location_name

  def location_name
    object.location.name
  end
end