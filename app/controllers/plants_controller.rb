class PlantsController < ApplicationController
  def index
    plants = Plant.all
    render json: plants, except: omitted_attributes, status: :ok
  end

  def show
    plant = find_plant
    render json: plant, except: omitted_attributes, status: :ok
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, except: omitted_attributes, status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end

  def find_plant
    Plant.find(params[:id])
  end

  def omitted_attributes
    [:created_at, :updated_at]
  end
end
