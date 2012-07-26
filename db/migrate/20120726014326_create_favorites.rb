class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :favoriter_id
      t.integer :favoritee_id

      t.timestamps
    end
    add_index(:favorites, [:favoriter_id, :favoritee_id], unique: true)
  end
end
