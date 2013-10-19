class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :exercise
      t.references :wod

      t.timestamps
    end
  end
end
