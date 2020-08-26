class AddPartyToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :party, :string
  end
end
