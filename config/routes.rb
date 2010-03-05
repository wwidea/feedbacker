ActionController::Routing::Routes.draw do |map|
    map.resources :remarks,             :only => [:create]
end