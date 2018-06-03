class ClassSchedule < ApplicationRecord
	has_and_belongs_to_many	:students, join_table: :class_schedules_students

	has_many :reviews, as: :reviewable

	belongs_to :professor
	belongs_to :subject

	delegate :name, to: :professor, prefix: true

	validates_presence_of :days, :time_schedule, :room

	validate :daysss

	def display_days
		dd = []

		days.split('').each { |i| dd << AppHelper.days_index[i.to_sym] }

		dd.join(' | ')
	end

	def ratings
		reviews.empty? ? nil : reviews.average(:rating).round
	end

	def days_index
		@days_index
	end

	def days_index=(val)
		@days_index = val
	end

	private

		def daysss
			logger.debug("=" * 1000)
			logger.debug("---#{@days_index}")
			logger.debug("---#{days_index}")
		end
end
