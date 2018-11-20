class HeroSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  has_many :spells do |object|
  	SpellSerializer.new(object)
  end

end
