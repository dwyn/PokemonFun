#   create_table "items", force: :cascade do |t|
#     t.string "name"
#     t.bigint "trainer_id", null: false
#     t.bigint "pokemon_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["pokemon_id"], name: "index_items_on_pokemon_id"
#     t.index ["trainer_id"], name: "index_items_on_trainer_id"
#   end

#   create_table "moves", force: :cascade do |t|
#     t.string "name"
#     t.string "type"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

# Information about Pokemon PokeApi
# Docs https://pokeapi.co/docs/v2.html/
# Gem https://github.com/rdavid1099/poke-api-v2

Item.destroy_all
Item.reset_pk_sequence

Pokemon.destroy_all
Pokemon.reset_pk_sequence

Trainer.destroy_all
Trainer.reset_pk_sequence

Team.destroy_all
Team.reset_pk_sequence

User.destroy_all
User.reset_pk_sequence

# ActiveRecord::Base.connection.reset_pk_sequence!('items')
# ActiveRecord::Base.connection.reset_pk_sequence!('pokemons')
# ActiveRecord::Base.connection.reset_pk_sequence!('trainers')
# ActiveRecord::Base.connection.reset_pk_sequence!('teams')
# ActiveRecord::Base.connection.reset_pk_sequence!('users')


User.create!(
  email: "paul@email.com",
  password: "password",
  first_name: "Paul",
  last_name: "Rosero",
  user_name: "lmt23",
  admin: true
)

User.create!(
  email: "dwayne@email.com",
  password: "password",
  first_name: "Dwayne",
  last_name: "Harmon",
  user_name: "dwyn",
  admin: false
)

p "#{User.count} users created!"


teams = ["Valor", "Mystic", "Instinct"]

teams.each do |team|
  temp_team = Team.create!( name: team)
  if team == "Valor"
    temp_team.valor!
  elsif team == "Mystic"
    temp_team.mystic!
  else
    temp_team.instinct!
  end
end

p "#{Team.count} teams created!"


Trainer.create!(
  name: "Rando",
  badges: "Who knows",
  team_id: Team.first.id
)

p "#{Trainer.count} trainer created!"

poke_list = PokeApi.get(pokemon: {limit: 200})
poke_list.results.each  do |pkmn|
  temp_pokemon = Pokemon.create!(
    name: pkmn.name,
    pkmn_type: PokeApi.get(pokemon: pkmn.name).types[0].type.name,
    pokedex: Pokemon.count == 0 ? 1 : Pokemon.last.pokedex + 1,
    level: Faker::Number.between(from: 1, to: 1000),
    attack: Faker::Number.between(from: 1, to: 600),
    defense: Faker::Number.between(from: 1, to: 600),
    sp_attack: Faker::Number.between(from: 1, to: 600),
    sp_defense: Faker::Number.between(from: 1, to: 600),
    speed: Faker::Number.between(from: 1, to: 600),
    trainer_id: Trainer.first.id,
    user_id: Faker::Number.between(from: User.first.id, to: User.last.id)
  )
  temp_pokemon.image.attach(io: File.open('./public/pkmndflt.png'), filename: 'pkmndflt.png')
  temp_pokemon.image.analyze
end

p "#{Pokemon.count} pokemon created!"