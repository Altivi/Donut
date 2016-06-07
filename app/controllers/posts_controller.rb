class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
  end

  def show
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
        format.js
      else
        format.html
        format.js
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :author)
  end
end
