Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :scores
      resources :price_datas
    end
  end
end
