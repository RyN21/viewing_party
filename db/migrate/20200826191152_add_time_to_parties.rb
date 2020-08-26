class AddTimeToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :time, :string
  end
end
