class RemoveAliasFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :alias, :string
  end
end