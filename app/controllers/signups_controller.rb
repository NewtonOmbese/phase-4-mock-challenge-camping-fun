class SignupsController < ApplicationController
  def create
    signup = Signup.create(signup_params)
    if signup.valid?
      render json: signup.activity, status: 201
    else
      render json: {errors: ["Validations"]}, status: 422
    end
  end

  private

  def signup_params
    params.permit(:camper_id, :activity_id, :time)
  end

end
