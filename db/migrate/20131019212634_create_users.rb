class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :user_type #member, coach, or admin
      t.string :profile_img

      t.timestamps
    end
  end
end
