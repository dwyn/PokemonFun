class AddColumnsToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :badges, :string
    add_reference :trainers, :team, null: false, foreign_key: true
  end
end
