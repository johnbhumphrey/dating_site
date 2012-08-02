class AddSaveSearchToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :save_search, :boolean, default: false
  	add_index :searches, :save_search
  end
end
