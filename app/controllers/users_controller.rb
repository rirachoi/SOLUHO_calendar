class UsersController < ApplicationController
  before_action :check_if_logged_in, :except => [:new, :create]
  before_action :check_if_admin, :only => [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    # Automatically save the new user's B-day in current year as the first event!
    birthday = @user.dob.to_s
    # Current year + The user's birth month & day
    birthday = @date.year.to_s + "-" + birthday[5,9]
    # Create a new event and Save it
    @user.events.new(:name => 'My Birthday', :date => Date.parse(birthday), :image => 'http://i.imgur.com/7NfALqS.png?1', :user_id => @user.id );
    @user.save

    if @user.save
      session[:user_id] = @user.id
      # Automatically sign in when the user is saved
      authenticate_user
      redirect_to events_lists_path
    else
      render :new
    end
  end

  def index
      @users = User.all
  end

  def edit
    @user = User.find params[:id]
    unless @user.id == @current_user.id
    redirect_to calendar_show_path
    end
  end

  def update
    user = User.find params[:id]
    user.update user_params

    redirect_to root_path
  end

  def show
    @user = @current_user # User.find params[:id]
    if @user.nil?
      redirect_to root_path
    end
    @user = User.find params[:id]
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :dob, :image, :password, :password_confirmation)
    end

    def check_if_logged_in
      redirect_to(root_path) if @current_user.nil?
    end

    def check_if_admin
      redirect_to(root_path) unless @current_user.is_admin?
    end

end
