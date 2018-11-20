FactoryGirl.define do
  factory :spell do
    name        'fake_spell'
    spell_type  'basic'
    cooldown    '3'
    description 'fake - spell: description'
  end

  factory :hero do
    name SecureRandom.uuid

    after(:create) do |hero, eval|
      create_list(:spell, 5, hero: hero)
      create(:spell, cooldown: 0, spell_type: 'ultimate', hero: hero)
    end
  end
end