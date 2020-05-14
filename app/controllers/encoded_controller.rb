class EncodedController < ApplicationController
    before_action :redirect_if_not_logged_in



    def show
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @encoded_message = @post.content
        else
        end
    end


    private

    # def post_params
    #     params.require(:post).permit(:title, :content)
    # end

    def set_encoded_message
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
