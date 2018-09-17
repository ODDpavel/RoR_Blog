class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def update
    if @post.update_attributes(comment_params)
      redirect_to post_path(@post), success: 'Comment was success updated' # направляет с сообщением зелёного цвета (бутстраповские алерты)
    else
      render :edit, danger: 'Comment was not updated' # направляет с сообщением красного цвета (бутстраповские алерты)
    end
  end



  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render json: { success: true}
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
