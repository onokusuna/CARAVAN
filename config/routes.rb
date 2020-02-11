Rails.application.routes.draw do
  get 'blogs/index'
  get 'blogs/show'
  get 'blogs/new'
  get 'blogs/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resourcesの書き方は、コロン(:)をつける位置によってエラーがよく発生してしまいます
  # resources :posts, only: [:index]という書き方もある、resources :posts, :indexは誤り
  resources :blogs
end
