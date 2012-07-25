class AddNickNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :nick_name, :string
  end
end
