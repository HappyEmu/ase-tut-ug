Rails.application.routes.draw do
  resources :articles, shallow: true do
    resources :comments
  end
  root to: 'welcome#welcome'
end
