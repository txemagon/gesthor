class AddThToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :teaching_hours, :integer, :null => false, :default => 0
  end
end
