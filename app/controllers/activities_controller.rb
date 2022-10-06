class ActivitiesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
wrap_parameters false

  def index
    activity = Activity.all
    render json: activity, status: 200
  end

  def destroy
    activity = Activity.find(params[:id])
    if activity
      activity.destroy
    else
      render json: { error: 'Activity not found' }, status: 404
    end
  end

  private

  def render_not_found_response
    render json: { error: 'Activity not found' }, status: :not_found
  end

end
