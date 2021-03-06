class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @places = Place.page params[:page]
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end

  def edit
    @place = Place.find(params[:id])

    # here
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    # to here is for single user editing. see show.html.erb for secondary code
  end

  def update
    @place = Place.find(params[:id])

    # here
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    # to here is for single user editing. see show.html.erb for secondary code
    
    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to place_path(@place)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])

    # here
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    # to here is for single user editing. see show.html.erb for secondary code
    

    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end


end
