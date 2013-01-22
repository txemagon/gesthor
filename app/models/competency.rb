class Competency < ActiveRecord::Base
  attr_accessible :level_description_id, :statement
  belongs_to :level_description
  has_many :subjects, :through => :subject_competencies

  validates_presence_of :level_description_id, :statement
end
