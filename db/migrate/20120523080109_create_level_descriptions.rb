class CreateLevelDescriptions < ActiveRecord::Migration
  def change
    create_table :level_descriptions do |t|
      t.integer :training_level_id, :null => false

      t.timestamps
    end
  end
end
