Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'projects/:project_id/recommended_partners', to: 'projects#recommended_partners'
end
