class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :email
      t.string :password
      t.string :user_type #coach or admin (null = regular member)
      t.string :profile_pic

      t.string :name, :null => false

      t.timestamps
    end
  end
end
