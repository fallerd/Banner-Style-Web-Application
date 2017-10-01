class Professor < ApplicationRecord
	has_many :sections
	has_many :courses, through: :sections

	validates :professor_name, :email_address, uniqueness: true
  	validates :professor_name, :email_address, :office_location, presence: true
  	validates :professor_name, :email_address, :office_location, length: { maximum: 100, minimum: 2 }
  	validates :email_address, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\Z/, message: "Must be formatted as xxx@xxx.xxx"}
  	validates :office_location, format: { with: /\A([a-z]|[A-Z]){1,3}[0-9]{1,4}\Z/, message: "Must be formatted like XX###" }

	def self.search(search)
    	if search
      		self.where("professor_name like ?", "%#{search}%")
    	else
    		self.all
    	end
  	end
end
