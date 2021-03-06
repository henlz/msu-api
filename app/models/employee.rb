class Employee < ApplicationRecord
  enum role: [:driver, :helper]

  belongs_to :location
  # has_many :work_experience, dependent: :destroy

  # deactivates the serializer by default
  def active_model_serializer
    nil
  end

  validates_presence_of :ssn, :name, :birth_date, :role
  validates_length_of :ssn, :is => 9
  validates_numericality_of :ssn
  validates_uniqueness_of :ssn
end
