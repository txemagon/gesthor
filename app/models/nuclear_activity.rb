class NuclearActivity < ActiveRecord::Base
  attr_accessible :learning_outcome_id, :statement

  belongs_to :learning_outcome

  validates :learning_outcome_id, :presence => true, :uniqueness => true

end
