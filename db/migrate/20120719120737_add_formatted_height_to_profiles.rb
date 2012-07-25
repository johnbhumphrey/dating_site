class AddFormattedHeightToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :formatted_height, :string
  end
end
