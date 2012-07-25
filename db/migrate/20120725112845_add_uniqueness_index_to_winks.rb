class AddUniquenessIndexToWinks < ActiveRecord::Migration
  def change
  	add_index(:winks, [:sender_id, :receiver_id], unique: true)
  end
end
