FactoryGirl.define do
  factory :hero do
    name 'FakeHero'

    after(:create) do |hero, eval|
      create_list(:spell, 5, hero: hero)
      create(:spell, cooldown: 0, spell_type: 'ultimate', hero: hero)
    end
  end
end