class HeroesController < ApplicationController
  def index
    binding.pry
    heroes = Hero.select(:id, :name)

    # TODO - https://trello.com/c/9I2pVgmr
    render json: { 'data' => heroes.order(:id) }
  end

  def show
    options = {}
    options[:include] = [:spells]

    render json: HeroSerializer.new(hero, options).serializable_hash
  end
   
  private
 
  def hero
    @hero ||= Hero.find params[:id]
  end

  def hero_params
    params.require(:hero).permit(:name)
  end
end
