class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    Place.create(place_params)
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

  #def self.search(term, page)
  #  if term
  #    where('name LIKE ?', "%#{term}%").order('id DESC').page(current_page)
  #  else
  #    order('id DESC').page(current_page)
  #  end
  #end

end
