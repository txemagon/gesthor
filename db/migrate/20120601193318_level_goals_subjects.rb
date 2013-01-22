class LevelGoalsSubjects < ActiveRecord::Migration
  def up
    create_table :level_goals_subjects, :id => false do |t|
      t.integer :subject_id
      t.integer :level_goal_id
    end
    add_index :level_goals_subjects, [:subject_id, :level_goal_id], :unique => true
  end

  def down
    drop_table :level_goals_subjects
  end
end
