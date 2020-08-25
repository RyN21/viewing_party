class RemovePartyFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :party, :string
  end
end
