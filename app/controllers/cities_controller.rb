class CitiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_countries, only: [:index, :edit, :destroy]
  before_action :set_city, only: [:edit, :update, :destroy]

  def index
    @cities = City.all
    @city = City.new
  end
  
  def edit
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_url, notice: 'City was successfully created.'
    else
      redirect_to cities_url, alert: 'City was not created.'
    end
  end

  def update
    if @city.update(city_params)
      redirect_to cities_url, notice: 'City was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_url
  end

  private
    def get_countries
      @countries = Country.all
    end

    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :country_id)
    end
end
