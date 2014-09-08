class EventsController < ApplicationController

  def index
     @region = params[:region]
     # Setting current date dynamically
     @date = date_params
     # Australia needs state(=@region)
     country = Enrico::Country.new("aus", @region)
     # To display public holiday and the user's events together.
     @public_holidays = country.public_holidays_for_month(@date)
     @events = Event.where(:user_id => @current_user.id)
  end

  def create
    event = Event.create event_params
    event.save
    @current_user.events << event
    redirect_to event_path
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find params[:id]
    unless @event.user_id == @current_user.id
      redirect_to root_path
    end
  end

  def lists
    @date = date_params
    @events = Event.where(:user_id => @current_user.id).order(:date).reverse
    # @past_events = @events[:date] < @date
    # @future_events = @events[:date] > @date
    country = Enrico::Country.new("aus", "New South Wales")
    @public_holidays = country.public_holidays_for_year(@date)
  end

  def kind
    # Insead of Creating a new table I wrote this....
    # I agree it is not the best way but it was my first project!!
    # I don't want change this but keep it as a memory lol!
    image = case params[:kind]
      when 'Birthday' then 'http://i.imgur.com/7NfALqS.png?1'
      when 'Anniversary' then 'http://i.imgur.com/VfuWprd.png?1'
      when 'Wedding' then 'http://i.imgur.com/pEZwa3W.png?1'
      when 'Babyshower' then 'http://i.imgur.com/QgyWEnt.png?1'
      when 'Dinner' then 'http://i.imgur.com/g2Pa7a9.png?1'
      when 'Party' then 'http://i.imgur.com/BIrp93l.png?1'
      when 'Travel' then 'http://i.imgur.com/OcIn4ds.png?1'
      when 'Meeting' then 'http://i.imgur.com/VgujmI2.png?1'
      when 'Workshop' then 'http://i.imgur.com/q4shvdS.png?1'
      when 'Presentation' then 'http://i.imgur.com/f10BbHs.png?1'
      when 'Conference' then 'http://i.imgur.com/5PrjrVs.png?1'
      when 'Others' then 'http://i.imgur.com/tAT8AUw.png?1'
    end
    @events = Event.where(:user_id => @current_user.id, :image => image)
    render :kinds
  end

  def kinds
    @events = Event.where(:user_id => @current_user.id)
  end

  def show
    @event = Event.find params[:id]

  end

  def update
    event = Event.find params[:id]
    event.update event_params
    event.save

    redirect_to event_path
  end

  def destroy
    event = Event.find params[:id]
    event.destroy

    redirect_to events_path
  end

  private
  def date_params
    # It is a way to set current day dynamically
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def event_params
    params.require(:event).permit(:name, :date, :image, :user_id)
  end

end