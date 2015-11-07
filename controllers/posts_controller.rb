class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created."}
        formt.json { render json: @post.errors, status: :created, location: @post}
      else 
        format.html { render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

    def edit
    end

    def update 
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit' 
      end
    end

    def destroy
      @post.destroy
      redirect_to chapters_path
    end

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def chapter_params
      params.require(:post).permit(:title, :content, :user_id)
    end

end
