class CampersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
wrap_parameters false

  def index
    campers=Camper.all
    render json: campers
  end

  def show
    camper = Camper.find_by(id: params[:id])
    if camper
        render json: camper.to_json(include: [activities: {only: [:name,:difficulty,:id]}]), status: :ok
    else
        render json: {error: "Camper not found"}, status: :not_found
    end
  end

  def create
    camper=Camper.create(camp_params)
    if camper.valid?
      render json: camper, status: :created
    else
        render json: {errors: ["validation "]}, status: :unprocessable_entity
    end
  end

  private
  def render_not_found_response
    render json: {error: "Camper not found"}, status: :not_found
  end

  def camp_params
    params.permit(:name, :age)
  end

  def render_invalid_response
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
