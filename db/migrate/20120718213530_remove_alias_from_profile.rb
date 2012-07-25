class RemoveAliasFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :alias
      end

  def down
    add_column :profiles, :alias, :string
  end
end
