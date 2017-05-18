class CreateWorkExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :work_experiences do |t|
      t.string :company
      t.date :start
      t.date :end
      t.belongs_to :employee, index: true

      t.timestamps
    end
  end
end
