class CommentsController < ApplicationController

    def index
        # how to check if its nested?
        if params[:post_id] && @post = Post.find_by_id(params[:post_id]) #then its nested
            @comments = @post.comments
            else
                @error = "That post doesn't exist"
                @comments = Comment.all
        end
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show 
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params(:id))
    end
    
    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
