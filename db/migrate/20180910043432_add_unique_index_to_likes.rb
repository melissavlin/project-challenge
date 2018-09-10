class AddUniqueIndexToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, [:user_id, :dog_id], unique: true
  end
end
