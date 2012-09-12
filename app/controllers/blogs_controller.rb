class BlogsController < ApplicationController
  before_filter :must_be_admin, except: [ :index, :show ]

  def new
    @blog= Blog.new
  end

  def edit
  end

  def update
  end

  def create
    @blog= current_user.blogs.build(params[:blog])
    if @blog.save
      redirect_to @blog, flash: { success: "Blog successfully created." }
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @blog= Blog.find(params[:id])
  end

  def index
  end

  private

    def must_be_admin
      redirect_to root_path, error: "No access" unless current_user.admin?
    end
end
