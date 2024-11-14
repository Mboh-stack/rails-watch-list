Rails.application.routes.draw do
  # Routes pour afficher toutes les listes, voir une liste et en créer une nouvelle
  resources :lists, only: [:index, :show, :new, :create]
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
