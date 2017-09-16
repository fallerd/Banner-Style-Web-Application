class Section < ApplicationRecord
  belongs_to :course
  belongs_to :professor
  validates :number, uniqueness: { scope: :course, message: "Sections for courses must be unique" }
end
