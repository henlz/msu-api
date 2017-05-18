class Employee < ApplicationRecord
    enum role: [ :driver, :helper ]
    has_many :work_experience, dependent: :destroy
end
