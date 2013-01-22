class Qualification < ActiveRecord::Base
  attr_accessible :code, :level_description_id, :partial, :statement
  belongs_to :level_description

  validates_presence_of :code, :statement, :level_description_id
  validates_uniqueness_of :code, :statement
end
