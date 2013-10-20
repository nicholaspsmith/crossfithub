class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.string :name
      t.integer :rounds
      t.string :description

      t.timestamps
    end
  end
end
