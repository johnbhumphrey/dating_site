class AddInterestedInToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :interested_in, :string
  end
end
