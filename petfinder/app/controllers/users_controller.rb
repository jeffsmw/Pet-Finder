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
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      falsh[:success] = "your account was updated successfully"
      render :json
    else
      render :edit
    end
  end


end
