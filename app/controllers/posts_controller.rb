class PostsController < ApplicationController
  before_action :user_logged_in?, except: [:index]

  def index
    @posts = Post.includes(:user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    post = Post.find params[:id]
    if post.user == current_user
      post.destroy
      flash[:success] = 'Post deleted successfully'
    else
      flash[:danger] = "You're not allowed to delete other people's posts"
    end

    redirect_to :root
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
