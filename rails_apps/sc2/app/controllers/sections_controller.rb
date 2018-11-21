class SectionsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_page

  layout "admin"
  
  def index
    @sections = @page.sections.order("position ASC")
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @secton = Section.new({:page_id => @page.id})
    @section_size = Section.count + 1
    @pages = Page.order('position ASC')
    @pages = @page.subject.pages.order("position ASC")
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to(:action => 'index', :page_id => @page.id)
      flash[:notice] = "Section #{@section.name} je upravo napravljen!"
    else
      @section_size = Section.count + 1
      #@pages = Page.order('position ASC')
      @pages = @page.subject.pages.order("position ASC")
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
      redirect_to(:action =>'show', :id => @section.id, :page_id => @page.id)
      flash[:notice] = "Update je uspesno izvsen!"
    else
      @section_size = Section.countd
      @pages = Page.order('position ASC')
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    redirect_to(:action =>'index', :page_id => @page.id)
    flash[:notice] = "Section '#{section.name}' je obrisan!"
  end

 private
    def section_params
      params.require(:section).permit(:name, :visible, :position,:content, :content_type, :page_id)
    end
    def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end
end