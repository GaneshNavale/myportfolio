class PostsController < ApplicationController

	before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :redirect_if_unauthorized_access!, :set_selected_tab

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @selected_tab = { blog: :active }
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
    reditrect_to posts_path
  end

  def edit
    @selected_tab = { blog: :active }
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@posts)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
    reditrect_to posts_path
  end

  def show
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
    reditrect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def redirect_if_unauthorized_access!
  	unless user_signed_in?
  		flash[:alert] = 'Access Denied'
  		redirect_to root_path
		end
  end
  
  def set_selected_tab
    @selected_tab = { blog: :active }
  end
    
end
