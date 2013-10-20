class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :user_type #coach or admin (null = regular member)
      t.string :profile_pic, :null => false

      t.timestamps
    end
  end
end
