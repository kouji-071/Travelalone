class PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.post_comments.build(post_comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントしました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "コメントできませんでした。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :body)
  end
end
