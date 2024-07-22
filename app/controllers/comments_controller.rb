class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @potin = Potin.find(params[:potin_id])
    @comment = @potin.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @potin, notice: "Votre commentaire a été ajouté avec succès."
    else
      redirect_to @potin, alert: "Erreur lors de l'ajout du commentaire."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

