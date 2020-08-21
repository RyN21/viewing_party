class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :profile
      t.string :openid
      t.string :google_token
      t.string :google_refresh_token

      t.timestamps
    end
  end
end