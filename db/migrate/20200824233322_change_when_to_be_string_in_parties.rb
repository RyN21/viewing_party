class ChangeWhenToBeStringInParties < ActiveRecord::Migration[5.2]
  def up
    change_column :parties, :when, :string
  end

  def down
    change_column :parties, :when, :integer
  end
end
