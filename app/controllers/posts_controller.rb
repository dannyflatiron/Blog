class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @post = Post.all
        # binding.pry
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