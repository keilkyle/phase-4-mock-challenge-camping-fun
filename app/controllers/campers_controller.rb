class CampersController < ApplicationController
    wrap_parameters format: []
    
    rescue_from ActiveRecord::RecordNotFound, with: :record_nope
    rescue_from ActiveRecord::RecordInvalid, with: :bad_create

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper, serializer: OneCamperSerializer, status: :ok
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private
    
    def record_nope
        render json: {error: "Camper not found"}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

    def bad_create
        render json: {errors: [:validation_errors]}, status: :unprocessable_entity
    end

end
