class CreateHiddens < ActiveRecord::Migration
  def change
    create_table :hiddens do |t|
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :hiddens, [:sender_id, :receiver_id], unique: true
  end
end
