class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_nope

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = Activity.find_by!(id: params[:id])
        activity.destroy
    end

    private

    def record_nope
        render json: {error: "Activity not found"}, status: :not_found
    end

end
