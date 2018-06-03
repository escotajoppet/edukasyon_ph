class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	# t.belongs_to	:professor, index: true
    	# t.belongs_to	:class_schedule, index: true
      t.references  :reviewable, polymorphic: true, index: true
    	t.string			:name
    	t.float  			:rating
    	t.text				:description

      t.timestamps
    end
  end
end
