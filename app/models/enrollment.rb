class Enrollment < ApplicationRecord
  belongs_to :section
  belongs_to :student

  validates :student, uniqueness: { scope: :section, message: "already registered in that section" }
end
