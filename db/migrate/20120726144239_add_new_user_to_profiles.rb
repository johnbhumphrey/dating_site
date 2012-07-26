class AddNewUserToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :new_user, :boolean
  end
end
