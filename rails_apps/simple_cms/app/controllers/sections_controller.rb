class SectionsController < ApplicationController
  
  before_action :confirm_logged_in

  layout "admin"
  
  def index
    @sections = Section.order("position ASC")
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @secton = Section.new()
    @section_size = Section.count + 1
    @pages = Page.order('position ASC')
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to(:action => 'index')
      flash[:notice] = "Section je upravo napravljen!"
    else
      @section_size = Section.count + 1
      @pages = Page.order('position ASC')
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_size = Section.count
    @pages = Page.order('position ASC')
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      redirect_to(:action =>'show', :id => @section.id)
      flash[:notice] = "Update je uspesno izvsen!"
    else
      @section_size = Section.count
      @pages = Page.order('position ASC')
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    redirect_to(:action =>'index')
    flash[:notice] = "Section '#{section.name}' je obrisan!"
  end

 private
    def section_params
      params.require(:section).permit(:name, :visible, :position,:content, :content_type)
    end
end