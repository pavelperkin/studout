class PlacesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :get_cities
  before_action :get_categories
  skip_before_action :verify_authenticity_token, only: [:index, :show]

  def index
    if user_signed_in? || request.format.json?
      @places = Place.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    unless user_signed_in? || request.format.json?
      redirect_to new_user_session_path
    end
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to places_url
  end

  private
    def get_categories
      @categories = Category.all
    end

    def get_cities
      @cities = City.all
    end

    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:title, :description, :discount, :discount_description, :city_id, :address, :category_id, :avatar)
    end
end
