class CreateLearningOutcomes < ActiveRecord::Migration
  def change
    create_table :learning_outcomes do |t|
      t.integer :subject_competency_id, :null => false
      t.text :statement, :null => false

      t.timestamps
    end
  end
end
