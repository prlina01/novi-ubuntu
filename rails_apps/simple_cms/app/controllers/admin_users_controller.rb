class AdminUsersController < ApplicationController
  
  before_action :confirm_logged_in

	layout 'admin'
  def index
  	@admin_users = AdminUser.sorted
  end

  def new
  	@admin_user = AdminUser.new
  end

  def create
    puts "PETAR1"
  	@admin_user = AdminUser.new(admin_user_params)
    puts "#{@admin_user}"
    puts "#{@admin_user.errors.full_messages}"
  	if @admin_user.save 
      redirect_to(:action => 'index')
  		flash[:notice] = 'New user successfully added!'
  	else
  		render('new')
  end
end


  def edit
  	@admin_user = AdminUser.find(params[:id])
  end

  def update
    puts 'PETAR1'
  	@admin_user = AdminUser.find(params[:id])
    puts "#{@admin_user}"
    puts "#{@admin_user.errors.full_messages}"
  	if @admin_user.update_attributes(admin_user_params)
  		flash[:notice] = 'User has been successfully updated'
  		redirect_to(:action => 'index')
  	else
  		render('edit')
  	end
  end

  def delete
  	@admin_user = AdminUser.find(params[:id])
  end

  def destroy
  	admin_user = AdminUser.find(params[:id]).destroy
  	flash[:notice] = "User #{admin_user} has been deleted successfully."
  end


  private
  	def admin_user_params
  		params.require[:admin_user].permit[:first_name, :last_name, :username, :email, :password]
  	end
  end
