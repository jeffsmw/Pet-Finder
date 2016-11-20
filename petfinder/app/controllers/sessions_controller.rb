class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email].downcase if params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_to do |format|
        # format.html { redirect_to tutors_url, notice: 'Tutor was successfully destroyed.' }
        # format.json { head :no_content }
        format.json { render json: {status: "successfully delete"} }


      end


    end
  end

  def destroy
    session[:user_id] = nil
  end
end
