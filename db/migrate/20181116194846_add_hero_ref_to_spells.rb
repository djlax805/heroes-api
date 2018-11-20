class AddHeroRefToSpells < ActiveRecord::Migration[5.0]
  def change
    add_reference :spells, :hero, foreign_key: true
  end
end
