class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :learning_outcome_id, :null => false
      t.text :statement

      t.timestamps
    end
  end
end
