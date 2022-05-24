class CommentsController < ApplicationController
  def create
    set_flat
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.flat = @flat
    if @comment.save
      redirect_to flat_path(@flat)
      else
        render "flats/show"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Modification réussie!"
    else
      flash[:alert] = "Erreur"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to flat_path
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :flat_id, :user_id)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end
end
