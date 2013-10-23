class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.time :time

      t.timestamps
    end
  end
end
