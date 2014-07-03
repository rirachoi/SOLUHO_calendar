class CalendarController < ApplicationController

  def home
  end

  def show
     @region = params[:region]
     @date = date_params
     country = Enrico::Country.new("aus", @region)
     # struct_am = Astro::Moon.phasehunt.moon_full.strftime("%D %T %Z")
     # raise params.inspect
     @public_holidays = country.public_holidays_for_month(@date)
     # raise params.inspect

      # raise params.inspect
      # solar_date = @date.to_s


  end

  def index
  end

  def international
    @country_code = params[:country_code]
    @date = date_params
    country = Enrico::Country.new(@country_code)
    @public_holidays = country.public_holidays_for_month(@date)
  end

  def international_lists
    @country_code = params[:country_code]
    @date = date_params
    country = Enrico::Country.new(@country_code)
    @public_holidays = country.public_holidays_for_year(@date)
  end

  def date_params
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end