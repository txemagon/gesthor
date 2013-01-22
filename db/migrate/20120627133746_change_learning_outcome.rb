class ChangeLearningOutcome < ActiveRecord::Migration
  def up
    rename_column :learning_outcomes, :subject_competency_id, :subject_id
  end

  def down
    rename_column :learning_outcomes, :subject_id, :subject_competency_id
  end

end
