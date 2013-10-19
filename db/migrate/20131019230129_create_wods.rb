class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.string :wod_name
      t.integer :reps
      t.references :exercise

      t.timestamps
    end
  end
end
