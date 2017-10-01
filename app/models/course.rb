class Course < ApplicationRecord
	has_many :sections
	has_many :professors, through: :sections

	validates :course_name, :code, uniqueness: true
  	validates :description, :course_name, :code, presence: true
  	validates :description, :course_name, :code, length: { maximum: 100, minimum: 2 }
  	validates :code, format: { with: /\A([a-z]|[A-Z]){2,4} [0-9]{1,4}([a-z]|[A-Z]){,1}\Z/, message: "Must be formatted like XXXX ####" }

	def self.search(search)
    	if search
      		self.where("course_name like ? or description like ? or code like ?", "%#{search}%", "%#{search}%", "%#{search}%")
    	else
    		self.all
    	end
  	end
end
