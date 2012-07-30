class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :viewer_id
      t.integer :viewed_id

      t.timestamps
    end
    add_index :views, :viewer_id
    add_index :views, :viewed_id
  end
end
