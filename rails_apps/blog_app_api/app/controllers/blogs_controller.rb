  class BlogsController < ApplicationController
  
  layout 'blog'
  before_action :find_specific, except: [:index, :new, :create, :contact]
  # after_action :head_title, except: [:destroy]
  access all: [:index,:show], reader: [:index, :show], admin: :all

  def index
    @blogs = Blog.order('created_at ASC')
    @blogs_published = Blog.hide_drafts
    @head_title = "Prlina's Blog"
    @head_subtitle = "Petar's very own personal blog!"
    @masthead_picture = "bg_index"
    @subscribed_users = User.where(["subscription = ?", 1])
    json_response "Loaded all blog posts", true, { blogs: @blogs}, :ok
  end

  def show
    @counter = 0
    @blog = Blog.includes(:comments).find(params[:id])
    @comment = Comment.new
    @head_title = @blog.title
    if @blog.user
      @head_subtitle = "Written by " + @blog.user.first_name + " " + @blog.user.last_name
    end
    @masthead_picture = "bg_show"
    json_response "Loaded blog post", true, { blog: @blog}, :ok
  end

  # def new
  #   @blog = Blog.new
  #   @head_title = "New post? Fantastic!"
  #   @head_subtitle = "Feel free to write anything you can imagine"
  #   @masthead_picture =  "bg_index"
  # end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      json_response "Successfully created a blog post", true, { blog: @blog}, :ok
    else
      json_response "Unsuccessfully created a blog post", false, {}, :unproccessable_entity
    end
  end

  # def edit
  #   @head_title = @blog.title
  #   @head_subtitle = "Written by " + @blog.user.first_name + " " + @blog.user.last_name
  #   @masthead_picture = "bg_show"
  # end

  def update
    if @blog.update(blog_params)
      json_response "Successfully updated a blog post", true, { blog: @blog}, :ok
    else
      json_response "Unsuccessfully updated a blog post", false, {}, :unproccessable_entity
    end
    
  end

  def destroy
    if @blog.destroy
      json_response "Blog post successfully deleted", true, {}, :ok
    else
      json_response "Blog post unsuccessfully deleted", true, {}, :unproccessable_entity
    end
  end

  def toggle_status
    if @blog.published?
      @blog.draft!
    elsif @blog.draft?
      @blog.published!
      @subscribed_users = User.where(["subscription = ?", 1])
      PublishedBlogMailer.published_blog_info(@subscribed_users, @blog).deliver_now
    end
    redirect_to blogs_path
  end


  private
    
    def blog_params
      params.require(:blog).permit(:body, :title, :topic_id, :user_id)
    end

    def find_specific
      @blog = Blog.find(params[:id])
    end

    # def head_title
    #   if @blogs
    #     @title = "Prlina's Blog"
    #   elsif @blog
    #     @title = @blog.title || "New post? Fantastic!"
    # end

end
