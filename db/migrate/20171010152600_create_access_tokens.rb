class CreateAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :access_tokens do |t|
      t.integer :user_id
      t.string :token
      t.string :ip
      t.datetime :last_active_at
      t.string :device
      t.string :device_id
      t.string :browser
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :access_tokens, :user_id
  end
end