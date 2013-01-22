class CreateEvaluationCriteria < ActiveRecord::Migration
  def change
    create_table :evaluation_criteria do |t|
      t.integer :learning_outcome_id, :null => false
      t.text :statement, :null => false

      t.timestamps
    end
  end
end
