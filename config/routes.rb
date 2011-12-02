Rails.application..routes.draw do
  scope(:as => 'refinery', :module => 'refinery') do
    resources :faqs, :only => [:index]
  end

  scope(:path => 'refinery', :as => 'refinery_admin', :module => 'refinery/admin') do
    resources :faqs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
