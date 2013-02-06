class NuclearActivity < ActiveRecord::Base
  attr_accessible :task_id, :statement
  belongs_to :task

  validates_presence_of :statement

end
