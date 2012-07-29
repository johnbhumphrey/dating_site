class RemoveTitleFromPrivateMessages < ActiveRecord::Migration
  def up
    remove_column :private_messages, :title
      end

  def down
    add_column :private_messages, :title, :string
  end
end
