class CreateTeachingUnits < ActiveRecord::Migration
  def change
    create_table :teaching_units do |t|
      t.string :title
      t.integer :subject_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
