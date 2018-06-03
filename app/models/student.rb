class Student < ApplicationRecord
	has_and_belongs_to_many	:class_schedules, join_table: :class_schedules_students
end
