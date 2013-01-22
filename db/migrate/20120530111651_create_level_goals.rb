class CreateLevelGoals < ActiveRecord::Migration
  def change
    create_table :level_goals do |t|
      t.text :statement, :null => false
      t.integer :level_description_id, :null => false

      t.timestamps
    end
  end
end
