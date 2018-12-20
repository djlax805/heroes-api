# heroes = [
#     "Junkrat",
#     "Mei",
#     "Reaper",
#     "Rheinhardt",
#     "Widowmaker",
#     "Mercy",
#     "Lucio",
#     "Symmetra",
#     "Zenyatta",
#     "Hanzo",
#     "Bastion",
#     "Torbjorn",
#     "Tracer",
#     "Soldier 76",
#     "Roadhog",
#     "D. Va",
#     "Zarya",
#     "Genji",
#     "McCree",
#     "Pharah",
#     "Winston"
# ]
#
# heroes.each do |hero|
#   h = Hero.find_or_initialize_by(name: hero)
#   h.name = hero
#   h.save!
# end
#
# #
# junkrat_spells = [
#     {
#         'name'        => 'Frag Launcher',
#         'type'        => 'normal',
#         'cooldown'    => '0',
#         'description' => 'Bouncing explosive projectile weapon.'
#     },
#     {
#         'name'        => 'Concussion Mine',
#         'type'        => 'normal',
#         'cooldown'    => '3',
#         'description' => 'Throw a knockback mine with LSHIFT then detonate with LCLICK.'
#     },
#     {
#         'name'        => 'Steel Trap',
#         'type'        => 'normal',
#         'cooldown'    => '5',
#         'description' => 'Place an immobilizing trap.'
#     },
#     {
#         'name'        => 'Total Mayhem',
#         'type'        => 'passive',
#         'cooldown'    => '0',
#         'description' => 'Drop bombs on death.'
#     },
#     {
#         'name'        => 'Rip-tire',
#         'type'        => 'ultimate',
#         'cooldown'    => '0',
#         'description' => 'Drive and detonate an exploding tire.'
#     }
# ]
#
# junkrat_spells.each do |spell|
#   s = Spell.find_or_initialize_by(name: spell['name'])
#   s.hero_id     = 1
#   s.name        = spell['name']
#   s.spell_type  = spell['type']
#   s.cooldown    = spell['cooldown']
#   s.description = spell['description']
#   s.save!
# end
