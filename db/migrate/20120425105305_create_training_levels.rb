class CreateTrainingLevels < ActiveRecord::Migration
  def change
    create_table :training_levels do |t|
      t.string :name, :null => false
      t.text :description
      t.string :short_name
      t.integer :parent_id

      t.timestamps
    end
  end
end
