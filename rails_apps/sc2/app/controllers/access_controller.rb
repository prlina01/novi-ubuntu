class AccessController < ApplicationController
  
  layout 'admin'
  #Svaki action osim ova 3 ce da proverava da li si prijavljen,
  # da bi znao da li bi trebao da imas njihov pristup
  before_action :confirm_logged_in, :except => [:login,:attempt_login,:logout]

  def index
  	# display text and links
  end

  def login
  	# login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:first_name] = authorized_user.first_name
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username or password combination"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:first_name] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => 'login')
  end
  

end
