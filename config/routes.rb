Rails.application.routes.draw do
 
  
  Rails.application.routes.draw do
  resources :local_de_atendimentos
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  scope "/admin" do
    get "dashboard", to: "dashboard#index" , as: :dashboard
    resources :pacientes
     resources :local_de_atendimentos
  end

end

#http://127.0.0.1:5000/users/sign_up
#http://127.0.0.1:5000/users/sign_in