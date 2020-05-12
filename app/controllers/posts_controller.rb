class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_post, only: [:show, :edit, :update]
    before_action :redirect_if_not_post, only: [:show, :edit, :update]

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @posts = @user.posts.most_comments
        else
            @error = "That user doesn't exist" if params[:user_id]
            @posts = Post.organize
        end
    end

    def new
        @post = Post.new
    end

    def show
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end



    private 

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find_by(id: params[:id])
        if !@post
            flash[:message] = "Post was not found"
            redirect_to posts_path
        end
    end

    def redirect_if_not_post
        redirect_to posts_path if !@post || @post.user != current_user
    end
end