class CommentsController < ApplicationController
	def create
		 @post = Post.find(params[:post_id])
         @comment = @post.comments.new(comment_params)
         @comment.user = current_user
         @comment.save
         redirect_to post_path(@post)     
	end

	def destroy 
	end
	
private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end
