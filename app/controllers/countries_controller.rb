class CountriesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.all
    @country = Country.new
  end

  def edit
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to countries_url, notice: 'Country was successfully created.'
    else
      redirect_to countries_url, notice: 'Country was not created.'
    end
  end

  def update
    if @country.update(country_params)
      redirect_to countries_url, notice: 'Country was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_url
  end

  private
    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name)
    end
end
