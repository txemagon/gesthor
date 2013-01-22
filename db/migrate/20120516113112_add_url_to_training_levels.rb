class AddUrlToTrainingLevels < ActiveRecord::Migration
  def change
    add_column :training_levels, :url, :string
  end
end
