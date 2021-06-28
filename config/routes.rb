Rails.application.routes.draw do
  get 'rpg/index'
  get 'farm' => 'rpg#farm'
  get 'cave' => 'rpg#cave'
  get 'casino' => 'rpg#casino'
  get 'house' => 'rpg#house'

  root 'rpg#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
