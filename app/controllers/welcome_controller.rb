class WelcomeController < ApplicationController
  def index
    render json: { hey: 'tadaa' }
  end
end
