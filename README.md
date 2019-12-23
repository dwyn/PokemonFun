  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "trainer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end