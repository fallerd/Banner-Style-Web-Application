class Section < ApplicationRecord
  belongs_to :course
  belongs_to :professor
  has_many :enrollments
  has_many :students, through: :enrollments
  
  validates :number, uniqueness: { scope: :course, message: "Sections for courses must be unique" }
  validates :number, format: { with: /\A[0-9]{1,2}\Z/, message: "Must be between 1 and 99"}
  validates :room_number, :days, :semester, :number, presence: true
  validates :room_number, :days, length: { maximum: 6, minimum: 2 }
  validates :time, format: { with: /\A[0-9]{1,2}:[0-9][0-9]-[0-9]{1,2}:[0-9][0-9]\Z/, message: "Must be a range of time like 1:00-3:00" }
  validates :room_number, format: { with: /\A([a-z]|[A-Z]){2,3}[0-9]{1,4}\Z/, message: "Must be formatted like XX###" }

  def self.search(search)
    if search
      self.joins(:professor, :course).where("number like ? or professors.professor_name like ? or courses.course_name like ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end

