class HeroesController < ApplicationController
  def index
    render json: HeroesSerializer.new(heroes).serializable_hash
  end

  def show
    options = {}
    options[:include] = [:spells]

    render json: HeroSerializer.new(hero, options).serializable_hash
  end

  private

  def hero
    @hero ||= Hero.find(params[:id])
  end

  def heroes
    @heroes ||= Hero.select(:id, :name)
  end

  def hero_params
    params.require(:hero).permit(:name)
  end
end
