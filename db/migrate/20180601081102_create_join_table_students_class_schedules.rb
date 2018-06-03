class CreateJoinTableStudentsClassSchedules < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :class_schedules do |t|
      t.integer	:student_id, index: true
      t.integer	:class_schedule_id, index: true
    end
  end
end
