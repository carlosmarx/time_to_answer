Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index'
    resources  :admins #administradores
    resources  :subjects #assuntos
    resources  :questions #Perguntas
  end
  namespace :site do
    get   'welcome/index'
    get   'search',   to: 'search#questions'
    get   'subject/:subject_id/:subject',   to: 'search#subject', as: 'search_subject'
    post  'answer',   to: 'answer#question'
  end
  
  namespace :users_backoffice do
    get   'welcome/index'
    get   'profile',    to: 'profile#edit'
    patch 'profile',    to: 'profile#update'
  end
  
  devise_for :admins, skip: [:registrations]
  devise_for :users
  
  get 'inicio', to: 'site/welcome#index'
  get 'admin', to: 'admins_backoffice/welcome#index'

  root to: "site/welcome#index"
end
