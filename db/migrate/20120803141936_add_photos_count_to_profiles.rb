class AddPhotosCountToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :photos_count, :integer
  end
end
