class SpellSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :spell_type, :cooldown, :description 

end
