class AddEmployeeToWorkedDay < ActiveRecord::Migration[5.0]
  def change
    add_reference :worked_days, :employee, foreign_key: true
  end
end
