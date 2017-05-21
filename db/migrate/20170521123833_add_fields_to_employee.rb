class AddFieldsToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :day_start_work, :date
    add_column :employees, :driver_license, :string
    add_column :employees, :ssn, :string
    add_column :employees, :address, :string
  end
end
