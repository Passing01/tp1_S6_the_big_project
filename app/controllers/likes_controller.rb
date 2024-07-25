class LikesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @gossip = Gossip.find(params[:gossip_id])
      @like = current_user.likes.build(gossip: @gossip)
      if @like.save
        redirect_to @gossip, notice: 'Liked the gossip.'
      else
        redirect_to @gossip, alert: 'Failed to like the gossip.'
      end
    end
  
    def destroy
      @like = current_user.likes.find(params[:id])
      @like.destroy
      redirect_to @like.gossip, notice: 'Unliked the gossip.'
    end
end
  