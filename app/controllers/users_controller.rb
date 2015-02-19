class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    render :show
  end

  def create
    user = User.create user_params
    url = 'http://104.131.73.180/api/v1/leads'
    @apiusers = HTTParty.get(url)
    # binding.pry
    # this is an email list form the api of all emails of the students in the api. this needs to get changed once the api gets update to include instructors
    emails = @apiusers["leads"].map do |person|
      person["contact"]["email"]
    end
    if emails.include? user.email
      user.auth_level = 2
    end
      redirect_to '/session'
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end

end
