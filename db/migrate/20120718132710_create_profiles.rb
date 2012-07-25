class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :about_me
      t.text :message_me_if
      t.text :good_at
      t.string :relationship_status
      t.integer :age
      t.string :sex
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
