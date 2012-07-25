class AddCaptionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :caption, :text
    add_column :photos, :primary, :boolean, default: false
  end
end
