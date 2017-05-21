class Employee < ApplicationRecord
    enum role: [ :driver, :helper ]
    # has_many :work_experience, dependent: :destroy

    # super_key = SecureRandom.base64(32)
    # attr_encrypted :ssn, key: super_key

    validates_presence_of :ssn, :name, :birth_date, :role
    validates_length_of :ssn, :is => 9
    validates_numericality_of :ssn
    validates_uniqueness_of :ssn
    # validates_as_ssn :ssn # Checks if a reserved or special SSN was sent
end
