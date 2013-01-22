class CreateSubjectCompetencies < ActiveRecord::Migration
  def self.up
    drop_table :competencies_subjects
    create_table :subject_competencies do |t|
      t.integer :competency_id, :null => false
      t.integer :subject_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :subject_competencies
    create_table :competencies_subjects, :id => false do |t|
       t.integer :subject_id
       t.integer :competency_id
     end
     add_index :competencies_subjects, [:subject_id, :competency_id], :unique => true
  end
end
