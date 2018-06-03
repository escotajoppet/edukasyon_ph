class Subject < ApplicationRecord
	has_many	:class_schedules
	has_many	:professors, through: :class_schedules
	has_many	:reviews, as: :reviewable

	def display_subject
		"#{self.code}: #{self.name}"
	end
	
	def ratings
		reviews.empty? ? nil : reviews.average(:rating).round
	end
end
