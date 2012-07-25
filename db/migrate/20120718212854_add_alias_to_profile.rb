class AddAliasToProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :alias, :string
  end
end
