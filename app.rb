require 'sinatra'
require "active_record"
require_relative 'config/application'
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end

  def old_form

  end

end


get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(:name)
  erb :'meetups/index'
end

get '/meetups/new' do

  erb :'meetups/new'
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])

  erb :'meetups/show'
end

post '/meetups/new' do
  @meetup_name = params[:meetup_name]
  @meetup_location = params[:meetup_location]
  @meetup_description = params[:meetup_description]
  @user = current_user


  new_meetup = Meetup.new(
    name: @meetup_name,
    location: @meetup_location,
    description: @meetup_description,
    user: @user
  )

  if new_meetup.valid?
    new_meetup.save
    redirect "/meetups/#{new_meetup.id}"
  else
    @error = new_meetup.errors.full_messages
    # @error.each do |er|
    #   flash[:notice] = er
    # end

    flash[:notice] = "Please fill in all fields"
    redirect "/meetups/new"
  end
end
