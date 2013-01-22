class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :code, :null => false
      t.text :statement, :null => false
      t.boolean :partial, :default => false
      t.integer :level_description_id

      t.timestamps
    end
  end
end
