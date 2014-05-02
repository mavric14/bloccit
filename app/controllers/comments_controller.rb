class CommentsController < ApplicationController
  def create
    @topic = Topic.find( params[:topic_id])
    @post = @topic.posts.find( params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @comment.save
    redirect_to [@topic,@post]
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
