class CreateWorkedDays < ActiveRecord::Migration[5.0]
  def change
    create_table :worked_days do |t|
      t.string :days
      t.float :salary
      t.float :extra
      t.float :deductions
      t.text :observations
      t.integer :week_number

      t.timestamps
    end
  end
end
