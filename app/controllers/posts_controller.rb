class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @posts = @user.posts
        else
            @error = "That user doesn't exist" if params[:user_id]
            @posts = Post.all
        end
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
    end


    private 

    def post_params
        params.require(:post).permit(:title, :content)
    end
end