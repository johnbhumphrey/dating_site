class RemoveZipCodeFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :zipcode
      end

  def down
    add_column :profiles, :zipcode, :integer
  end
end
