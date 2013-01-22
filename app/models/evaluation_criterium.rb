class EvaluationCriterium < ActiveRecord::Base
  attr_accessible :learning_outcome_id, :statement

  belongs_to :learning_outcome

end
