class AddLogoToTraningLevel < ActiveRecord::Migration

  def self.up
    change_table :training_levels do |t|
      t.has_attached_file :logo
    end
  end


  def self.down
    drop_attached_file :training_levels, :logo
  end

end
