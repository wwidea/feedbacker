Readaroute::Application.routes.draw do
    resources :remarks,             :only => [:create]
end