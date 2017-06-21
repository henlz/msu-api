class WorkedDay < ApplicationRecord
  belongs_to :employee

  @valid_week_days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  validates :days, presence: true, :inclusion=> {:in => @valid_week_days}

  serialize :days, Array
end
