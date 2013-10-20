class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :reps
      t.references :wod

      t.timestamps
    end
  end
end
