class GossipController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = current_user.gossips.build(gossip_params)
    if @gossip.save
      redirect_to @gossip, notice: 'Gossip was successfully created.'
    else
      render :new
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def update
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: 'Gossip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @gossip.destroy
    redirect_to gossips_path, notice: 'Gossip was successfully destroyed.'
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user == @gossip.user
  end
end
