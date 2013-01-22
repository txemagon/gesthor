class QualificationsSubjects < ActiveRecord::Migration
  def up
    create_table :qualifications_subjects, :id => false do |t|
      t.integer :subject_id
      t.integer :qualification_id
    end
    add_index :qualifications_subjects, [:subject_id, :qualification_id], :unique => true

  end

  def down
    drop_table :qualifications_subjects
  end
end
