class Professor < ApplicationRecord
	has_many :class_schedules
	has_many :subjects, through: :class_schedules
	has_many :reviews, as: :reviewable

	def ratings
		reviews.empty? ? nil : reviews.average(:rating).round
	end
end
