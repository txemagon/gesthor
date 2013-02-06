class CreateNuclearActivities < ActiveRecord::Migration
  def change
    create_table :nuclear_activities do |t|
      t.integer :task_id, :null => false
      t.text :statement

      t.timestamp
    end
  end
end
