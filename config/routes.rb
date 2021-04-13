Rails.application.routes.draw do

  namespace :admins_backoffice do
    get 'welcome/index'
    resources  :admins #administradores
    resources  :subjects #assuntos
    resources  :questions #Perguntas
  end

  namespace :site do
    get 'welcome/index'
  end
  
  namespace :users_backoffice do
    get 'welcome/index'
  end
  
  devise_for :admins
  devise_for :users
  
  get 'inicio', to: 'site/welcome#index'

  root to: "site/welcome#index"
end
