Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "articles#index"
  
  resources :articles do
    resources :comments # articlesの内側にネストしたリソース（nested resouce）としてcommentsが作成される
  end
  # get "/articles", to: "articles#index" #GET /articlesリクエストをArticlesControllerのindexアクションに対応付け
  # get "/articles/:id", to: "articles#show"
end
