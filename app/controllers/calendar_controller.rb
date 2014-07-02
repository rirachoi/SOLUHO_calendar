class CalendarController < ApplicationController

  def home
  end

  def show
     @region = params[:region]
     @date = date_params
     country = Enrico::Country.new("aus", @region)
     @public_holidays = country.public_holidays_for_month(@date)
     # raise params.inspect
  end

  def index
  end

  def international
    @country_code = params[:country_code]
    @date = date_params
    country = Enrico::Country.new(@country_code)
    @public_holidays = country.public_holidays_for_month(@date)
  end

  def date_params
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end