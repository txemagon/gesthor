Gestor::Application.routes.draw do
  resources :evaluable_competencies

  resources :teaching_units

  resources :evaluation_criteria

  resources :learning_outcomes

  resources :subject_competencies

  resources :level_goals

  resources :qualifications

  resources :competencies

  resources :level_descriptions

  resources :subjects

  resources :training_levels
  root :to => 'training_levels#index'
end
