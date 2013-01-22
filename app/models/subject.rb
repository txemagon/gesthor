class Subject < ActiveRecord::Base
  attr_accessible :code, :abbreviation, :description, :title, :training_level_id, 
                  :logo, :url, :value, :value_unit, :teaching_hours, 
		  :competency_ids, :qualification_ids, :level_goal_ids,
		  :subject_competencies_attributes,
                  :learning_outcomes

  belongs_to :training_level
  has_many :subject_competencies, :dependent => :destroy
# accepts_nested_attributes_for :subject_competencies, :allow_destroy => true
  has_many :competencies, :through => :subject_competencies
  has_many :learning_outcomes
  has_and_belongs_to_many :qualifications
  has_and_belongs_to_many :level_goals

  UNITS = [
    #disp value               #db value
    ["ECTS",                  "ects"],
    ["datetime.prompts.hour", "h"   ]
  ]


  validates :title, :training_level, :code, :presence => true
  validates :title, :code, :uniqueness => true
  validates_numericality_of :value, :teaching_hours

  validates :url, :uri => { 
     :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  validates_inclusion_of :value_unit, :in => UNITS.map { |disp, value| value }
  validate :terminal_level

  has_attached_file :logo, :styles => { :medium => "300x300>", 
                                        :small => "100x100>", 
                                        :tiny => "32x32>", 
                                        :invisible => "16x16>" },
                           :default_url => '/images/:attachment/missing_:style.png'

  def competency_ids=(args)
    self.subject_competencies.each { |sc| sc.destroy }
    args.each do |id|
      self.subject_competencies << SubjectCompetency.create(:competency_id => id, :subject_id => self.id)
    end
  end

  protected

  def terminal_level
    unless self.training_level
      error.add(:training_level_id, I18n.t('subject.invalid_level'))
      return false
    end
    error.add(:trainin_level_id, I18n.t('not_terminal')) unless self.training_level.is_leaf? 
  end

end
