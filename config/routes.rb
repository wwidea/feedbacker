Rails.application.routes.draw do
    resources :remarks,             :only => [:create]
end