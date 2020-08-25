class AddFriendToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :friend
  end
end
