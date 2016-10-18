class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, :status => :created
    else
      render json: {errors: user.errors.full_messages}, :status => :bad_request
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :social_security_number)
    end
end
