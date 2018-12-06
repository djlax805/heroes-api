FactoryGirl.define do
  factory :spell do
    name        'fake_spell'
    spell_type  'basic'
    cooldown    '3'
    description 'fake - spell: description'
  end

end