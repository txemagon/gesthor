class AddProfessionalFamilyToLevelDescription < ActiveRecord::Migration
  def change
    add_column :level_descriptions, :professional_family, :string
  end
end
