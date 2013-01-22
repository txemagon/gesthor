module SubjectCompetenciesHelper

  def competency_link_to(text, related, subject, relation)
    if relation == :competency and subject.competencies.include? related
      link_to text, edit_subject_competency_path(SubjectCompetency.where(:competency_id => related.id).first) if relation == :competency 
    end
  end
end
