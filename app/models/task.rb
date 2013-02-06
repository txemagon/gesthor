class Task < ActiveRecord::Base

  attr_accessible :learning_outcome_id, :statement, :nuclear_activities_attributes
  

  belongs_to :learning_outcome
  has_many :nuclear_activities, :dependent => :destroy
  accepts_nested_attributes_for :nuclear_activities, :reject_if => lambda { |a| a[:statement].blank? }, :allow_destroy => true
  
  validates_presence_of :statement

end
