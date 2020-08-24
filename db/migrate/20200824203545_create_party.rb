class CreateParty < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :duration
      t.string :when
      t.string :attendees

      t.timestamps
    end
  end
end
