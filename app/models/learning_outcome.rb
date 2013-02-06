class LearningOutcome < ActiveRecord::Base
  attr_accessible :statement, :subject_id, :evaluation_criteria_attributes, :tasks_attributes


  belongs_to :subject
  has_many :evaluation_criteria, :dependent => :destroy
  accepts_nested_attributes_for :evaluation_criteria, :reject_if => lambda { |a| a[:statement].blank? }, :allow_destroy => true

  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:statement].blank? }, :allow_destroy => true

  validates :statement, :subject_id, :presence => true 
  validates_uniqueness_of :statement, :scope => :subject_id
  
end
