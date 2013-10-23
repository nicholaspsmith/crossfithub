class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :kind
      t.references :user

      t.timestamps
    end
  end
end
