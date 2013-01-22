class EvaluableCompetency < ActiveRecord::Base
  attr_accessible :category, :name

    COMPETENCY_TYPES = [
      ["professional", "professional"],
      ["personal", "personal"],
      ["social", "social"],
    ]

    validates_inclusion_of :category, :in =>  COMPETENCY_TYPES.map { |disp, value| value }  
end
