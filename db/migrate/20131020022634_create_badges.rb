class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :img_url
      t.references :user

      t.timestamps
    end
  end
end
