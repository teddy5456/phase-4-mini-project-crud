class SpicesController < ApplicationController
    rescue_from ActionController::RoutingError, with: :route_not_found
  
    def index
      spices = Spice.all
      render json: spices
    end
  
    def create
      spice = Spice.create(spice_params)
      render json: spice, status: :created
    end
  
    def update
      spice = Spice.find(params[:id])
      spice.update(spice_params)
      render json: spice
    end
  
    def destroy
      spice = Spice.find(params[:id])
      spice.destroy
      head :no_content
    end
  
    private
  
    def spice_params
      params.require(:spice).permit(:title, :image, :description, :notes, :rating)
    end
  
    def route_not_found
      head :not_found
    end
  end
  