class SubjectCompetency < ActiveRecord::Base
  attr_accessible :competency_id, :subject_id#, :learning_outcomes_attributes

  belongs_to :subject
  belongs_to :competency
  # has_many :learning_outcomes, :dependent => :destroy
  # accepts_nested_attributes_for :learning_outcomes, :allow_destroy => true


  validates :competency_id,  :presence => true
  validates :subject_id, :presence => true
  validates_uniqueness_of :competency_id, :scope => :subject_id
  validate :valid_subject, :valid_competency

  protected

  def valid_subject
    errors.add(:subject_id, I18n.t('activerecord.error.messages.invalid')) if Subject.where(self.subject_id).blank?
  end

  def valid_competency
    errors.add(:competency_id, I18n.t('activerecord.error.messages.invalid')) if Competency.where(self.competency_id).blank?
  end

end
