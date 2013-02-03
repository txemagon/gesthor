class LevelGoal < ActiveRecord::Base
  attr_accessible :level_description_id, :statement

  belongs_to :level_description
  has_and_belongs_to_many :subjects

  validates :level_description_id, :presence => true
  validates :statement, :presence => true, :uniqueness => true

end
