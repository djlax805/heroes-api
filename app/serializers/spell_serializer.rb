class SpellSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :hero
  
  attributes :name, :spell_type, :cooldown, :description 

end
