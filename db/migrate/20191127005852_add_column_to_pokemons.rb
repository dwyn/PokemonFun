class AddColumnToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :slug, :string
    add_index :pokemons, :slug, unique: true
  end
end
