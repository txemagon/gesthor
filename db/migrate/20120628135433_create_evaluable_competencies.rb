class CreateEvaluableCompetencies < ActiveRecord::Migration
  def change
    create_table :evaluable_competencies do |t|
      t.string :name, :null => false
      t.string :category

      t.timestamps
    end
  end
end
