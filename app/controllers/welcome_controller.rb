class WelcomeController < ApplicationController
  def index
    render json: { "message": "Welcome to project diamond API"}
  end
end
