class AddBodyToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :body, :string
    remove_column :announcements, :message
  end
end
