class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit([:first_name,
                                                :last_name,
                                                :email,
                                                :password,
                                                :password_confirmation,
                                                :image,
                                                :city])
    @user = User.new user_params
    if @user.save
      PetMailer.notify_pet_owner(@user).deliver_now
      render json: @user.to_json
      # session[:user_id] = @user.id
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    render json: @user.to_json
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      # format.json { render json: {status: "successfully delete"} }
      render json: @user.to_json
    else
      render :edit
    end
  end


end
