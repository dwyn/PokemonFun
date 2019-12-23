class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :pkmn_type
      t.belongs_to :trainer, null: true, foreign_key: true

      t.timestamps
    end
  end
end
