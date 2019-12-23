class AddColumnsToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :pokedex, :int
    add_column :pokemons, :level, :int
    add_column :pokemons, :attack, :int
    add_column :pokemons, :defense, :int
    add_column :pokemons, :sp_attack, :int
    add_column :pokemons, :sp_defense, :int
    add_column :pokemons, :speed, :int
    add_reference :pokemons, :user, null: false, foreign_key: true
  end
end
