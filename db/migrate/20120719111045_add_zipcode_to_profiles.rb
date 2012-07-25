class AddZipcodeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :zipcode, :string
  end
end
