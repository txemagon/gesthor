class RenameLearningOutcomeAssociation < ActiveRecord::Migration
  def change
    change_table :learning_outcomes do |t|
      begin
        t.rename :subject_competency_id, :subject_id
      rescue
        puts "No need to rename subject_competency_id column." 
      end
    end
  end
end
