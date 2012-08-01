class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :min_age
      t.integer :max_age
      t.integer :min_height
      t.integer :max_height
      t.string :sex
      t.string :relationship_status

      t.timestamps
    end
  end
end
