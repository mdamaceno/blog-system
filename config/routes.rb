Blog::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :tags
    end
  end
end
