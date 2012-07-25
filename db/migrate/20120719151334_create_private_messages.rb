class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.string :title
      t.text :body
      t.datetime :read_at, default: nil

      t.timestamps
    end
  end
end
