class AddExtraFieldsToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :code, :string, :null => false, :default => "0"
    add_column :subjects, :value, :decimal, :precision => 6, :scale => 2, :default => 0
    add_column :subjects, :value_unit, :string, :default => "ECTS"
  end
end
