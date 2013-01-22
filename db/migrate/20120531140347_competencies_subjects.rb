class CompetenciesSubjects < ActiveRecord::Migration
  def up
    create_table :competencies_subjects, :id => false do |t|
      t.integer :subject_id 
      t.integer :competency_id
    end
    add_index :competencies_subjects, [:subject_id, :competency_id], :unique => true
  end

  def down
    drop_table :competencies_subjects
  end
end
