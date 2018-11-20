class HeroesController < ApplicationController
  def index
    heroes = Hero.select(:id, :name)

    # TODO - https://trello.com/c/9I2pVgmr
    render json: { 'heroes' => heroes.order(:id) }
  end

  def show
    # TODO - https://trello.com/c/TVq0AmKK
    render json: hero
  end
   
  private
 
  def hero
    @hero ||= Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name)
  end
end
