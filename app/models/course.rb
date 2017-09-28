class Course < ApplicationRecord
	has_many :sections
	has_many :professors, through: :sections

	def self.search(search)
    	if search
      		self.where("course_name like ? or description like ? or code like ?", "%#{search}%", "%#{search}%", "%#{search}%")
    	else
    		self.all
    	end
  	end
end
