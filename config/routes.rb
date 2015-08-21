Rails.application.routes.draw do
  root to: 'welcome#index'

  mount API => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
