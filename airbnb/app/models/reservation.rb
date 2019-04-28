class Reservation < ApplicationRecord

	#LINKS PART
	belongs_to :guest, class_name: "User"
	belongs_to :listing


	#VALIDATIONS PART
	validates_presence_of :start_date, :end_date
	validate :start_must_be_before_end_date


	def start_must_be_before_end_date
    	errors.add(:start_date, "must be before end date") unless
        	start_date < end_date
	end 

end
