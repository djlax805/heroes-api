class HeroSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  has_many :spells
end
