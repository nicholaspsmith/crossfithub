class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.time :time
      t.references :user

      t.timestamps
    end
  end
end
