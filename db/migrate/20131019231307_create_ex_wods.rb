class CreateExWods < ActiveRecord::Migration
  def change
    create_table :ex_wods do |t|
      t.references :exercise
      t.references :wod

      t.timestamps
    end
  end
end
