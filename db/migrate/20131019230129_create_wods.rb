class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.string :name
      t.integer :rounds
      t.string :description
      t.references :exercises
      t.references :gym
      t.references :completion

      t.timestamps
    end
  end
end
