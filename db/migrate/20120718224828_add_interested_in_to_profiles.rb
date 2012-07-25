class AddInterestedInToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :interested_in, :string
  end
end
