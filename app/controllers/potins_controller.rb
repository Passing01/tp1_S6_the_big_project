class PotinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @potins = Potin.all
  end

  def new
    @potin = Potin.new
  end

  def create
    @potin = current_user.potins.build(potin_params)

    if @potin.save
      redirect_to @potin, notice: "Votre potin a été créé avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @potin = Potin.find(params[:id])
  end

  private

  def potin_params
    params.require(:potin).permit(:title, :content)
  end

  def edit
    @potin = Potin.find(params[:id])

    unless @potin.user == current_user
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à modifier ce potin."
    end
  end

  def update
    @potin = Potin.find(params[:id])

    unless @potin.user == current_user
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à modifier ce potin."
    else
      if @potin.update(potin_params)
        redirect_to @potin, notice: "Le potin a été mis à jour avec succès."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @potin = Potin.find(params[:id])

    unless @potin.user == current_user
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à supprimer ce potin."
    end
  end



end
