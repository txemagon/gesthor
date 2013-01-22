class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title, :null => false
      t.string :abbreviation, :default => ""
      t.text :description
      t.integer :training_level_id, :null => false
      t.has_attached_file :logo

      t.timestamps
    end
  end
end
