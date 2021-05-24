Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/products", controller: "products", action: "index"
  post "/products", controller: "products", action: "create"
  get "/products/:id", controller: "products", action: "show"
  patch "/products/:id", controller: "products", action: "update"
  delete "/products/:id", controller: "products", action: "destroy"

  get "/suppliers", controller: "suppliers", action: "index"
  post "/suppliers", controller: "suppliers", action: "create"
  get "/suppliers/:id", controller: "suppliers", action: "show"
  patch "/suppliers/:id", controller: "suppliers", action: "update"
  delete "/suppliers/:id", controller: "suppliers", action: "destroy"

  post "/users" => "users#create"
  
  post "/sessions" => "sessions#create"

  get "/orders", controller: "orders", action: "index"
  post "/orders", controller: "orders", action: "create"
  get "/orders/:id", controller: "orders", action: "show"
 
end
