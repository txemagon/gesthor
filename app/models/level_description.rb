class LevelDescription < ActiveRecord::Base
  attr_accessible :training_level_id, 
                  :competencies_attributes, 
                  :qualifications_attributes, 
                  :level_goals_attributes,
                  :main_competency,
                  :european_benchmark,
                  :professional_profile,
                  :professional_environment,
                  :relevant_jobs,
                  :professional_family,
                  :prospective_of_the_degree

  belongs_to :training_level
  has_many :competencies, :dependent => :destroy
  accepts_nested_attributes_for :competencies, :allow_destroy => true
  has_many :qualifications, :dependent => :destroy
  accepts_nested_attributes_for :qualifications, :allow_destroy => true
  has_many :level_goals, :dependent => :destroy
  accepts_nested_attributes_for :level_goals, :allow_destroy => true


  validates :training_level_id, :presence => true, :uniqueness => true
  validate :valid_training_level
  validate :assign_to_terminal_level, :if => Proc.new {|a| a.training_level }

  def valid_training_level
    errors.add(:training_level_id, I18n.t('activerecord.errors.messages.record_invalid')) unless training_level
  end

  def assign_to_terminal_level
    errors.add(:training_level_id, I18n.t('not_terminal')) unless training_level.is_leaf?
  end

end
