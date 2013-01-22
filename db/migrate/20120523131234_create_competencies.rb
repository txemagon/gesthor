class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.text :statement, :null => false
      t.integer :level_description_id, :null => false

      t.timestamps
    end
  end
end
