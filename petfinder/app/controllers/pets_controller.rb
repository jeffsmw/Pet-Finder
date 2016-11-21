class PetsController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]
  # before_action :authorize_access, only: [:edit, :update, :destroy]
  before_action :find_pet, only: [:edit, :update, :destroy, :show]

  def new
    @pet = Pet.new
  end


  def create
    # @pet = Pet.new pet_params


    # pet_attr = params.require(:pet).permit(:address)
    @pet = Pet.new pet_params
    @pet.user = current_user

    if @pet.save
      redirect_to user_path(@pet.user)
    else
      render :new
    end

    #respond_to do |format|
      #   format.html { render }
      #   format.text { render }
      #   format.xml  { render xml: @pets }
      #format.json { render json: @pet.to_json }
    #end

    # if @pet.facebook_this
    # client = Facebook::REST::Client.new do |config|
    # config.consumer_key        = ENV['FACEBOOK_CONSUMER_KEY']
    # config.consumer_secret     = ENV['FACEBOOK_CONSUMER_SECRET']
    # config.access_token        = current_user.oauth_token
    # config.access_token_secret = current_user.oauth_secret
    # end
    # client.update @pet.title
    # end
  end


  def show
    @pet = Pet.find params[:id]
    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml  { render xml: @pet }
      format.json { render json: @pet.to_json }
    end
  end

  def index
    @pets = Pet.order(created_at: :desc)
    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml  { render xml: @pets }
      format.json { render json: @pets.to_json }
    end
  end


  def edit
  end

  def update
    @pet.update pet_params
    respond_to do |format|
      #   format.html { render }
      #   format.text { render }
      #   format.xml  { render xml: @pets }
      format.json { render json: @pet.to_json }
    end
  end


  def destroy


    @pet.destroy
    respond_to do |format|
      #   format.html { render }
      #   format.text { render }
      #   format.xml  { render xml: @pets }
      format.json { render json: {status: "successfully delete"} }

    end
  end

  private

  def pet_params
    params.require(:pet).permit([:pet_type,
                                 :breed,
                                 :name,
                                 :sex,
                                 :color,
                                 :age,
                                 :address,
                                 :date_seen,
                                 :note,
                                 :images,
                                 :lost,
                                ])
    # params.require(:pet).permit([:address])
  end

  def find_pet
    @pet = Pet.find params[:id]
  end

end
