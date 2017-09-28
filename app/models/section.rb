class Section < ApplicationRecord
  belongs_to :course
  belongs_to :professor
  validates :number, uniqueness: { scope: :course, message: "Sections for courses must be unique" }

  def self.search(search)
    if search
      self.joins(:professor, :course).where("number like ? or professors.professor_name like ? or courses.course_name like ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end

