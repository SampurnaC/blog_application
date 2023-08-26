class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id=current_user.id
        @comment.save!
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:post_id])
        @post.comments.find(params[:id]).destroy
        redirect_to @post
    end

    private
    
    def comment_params
        params.require(:comment).permit(:name, :comment)
    end

end
