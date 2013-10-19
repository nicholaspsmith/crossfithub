class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user
      t.references :gym
      t.string :role

      t.timestamps
    end
  end
end
