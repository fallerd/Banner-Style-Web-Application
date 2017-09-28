class Professor < ApplicationRecord
	has_many :sections
	has_many :courses, through: :sections

	def self.search(search)
    	if search
      		self.where("professor_name like ?", "%#{search}%")
    	else
    		self.all
    	end
  	end
end
