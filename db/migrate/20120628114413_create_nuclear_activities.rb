class CreateNuclearActivities < ActiveRecord::Migration
  def change
    create_table :nuclear_activities do |t|
      t.text :statement, :null => false
      t.integer :learning_outcome_id

      t.timestamps
    end
  end
end
