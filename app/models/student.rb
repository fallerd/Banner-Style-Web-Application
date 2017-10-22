class Student < ApplicationRecord
	has_many :enrollments
	has_many :sections, through: :enrollments

	validates :student_number, :email_address, uniqueness: true
	validates :student_number, :email_address, :name, presence: true
	validates :email_address, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\Z/, message: "Must be formatted as xxx@xxx.xxx"}
	validates :student_number, format: { with: /900[0-9]{6}/, message: "Student number must have 9 digits and start with 900"}

	def self.search(search)
    	if search
      		self.where("name like ?", "%#{search}%")
    	else
    		self.all
    	end
  	end
end
