class CreateClassSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :class_schedules do |t|
    	t.belongs_to	:professor, index: true
    	t.belongs_to	:subject, index: true
    	t.text   			:days
    	t.string			:time_schedule
    	t.string			:room

      t.timestamps
    end
  end
end
