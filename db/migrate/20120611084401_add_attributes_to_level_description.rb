class AddAttributesToLevelDescription < ActiveRecord::Migration
  def change
    add_column :level_descriptions, :main_competency, :text
    add_column :level_descriptions, :european_benchmark, :text
    add_column :level_descriptions, :professional_profile, :text
    add_column :level_descriptions, :professional_environment, :text
    add_column :level_descriptions, :relevant_jobs, :text
    add_column :level_descriptions, :prospective_of_the_degree, :text
  end
end
