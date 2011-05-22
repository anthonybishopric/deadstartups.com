Deadstartups::Application.routes.draw do

 resources :startups do
   collection do
     match 'tagged/:tag' => "startups#index", :as => :tagged
   end
 end
 resources :tags
 
 root :to => "startups#index"
 
 
end
