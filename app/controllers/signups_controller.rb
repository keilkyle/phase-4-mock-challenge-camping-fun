class SignupsController < ApplicationController
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordInvalid, with: :bad_create

    def create
        signup = Signup.create!(signup_params)
        activity = Activity.find_by(id: params[:activity_id])
        render json: activity, status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def bad_create
       render json: {errors: [:validation_errors]}, status: :unprocessable_entity 
    end

end
