class Student < ApplicationRecord
	has_many :enrollments
	has_many :sections, through: :enrollments
end
