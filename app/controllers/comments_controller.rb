class CommentsController < ApplicationController
  def create
    post = Post.find(params[:id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post
    if comment.save
      flash[:notice] = "Votre commentaire est posté"
    else
      flash[:error] = "Erreur lors de la publication de votre commentaire"
    end

    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
