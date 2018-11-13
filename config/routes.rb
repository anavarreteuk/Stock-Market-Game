Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :scores
      resources :price_datum
    end
  end
end
