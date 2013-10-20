class CreateBadgeUsers < ActiveRecord::Migration
  def change
    create_table :badge_users do |t|
      t.references :user
      t.references :badge

      t.timestamps
    end
  end
end
