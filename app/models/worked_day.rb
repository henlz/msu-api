class WorkedDay < ApplicationRecord
  belongs_to :employee

  # deactivates the serializer by default
  def active_model_serializer
    nil
  end

  @valid_week_days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  validates :days, presence: true, :inclusion=> {:in => @valid_week_days}

  serialize :days, Array
end
