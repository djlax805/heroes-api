class HeroesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  set_type :hero
end
