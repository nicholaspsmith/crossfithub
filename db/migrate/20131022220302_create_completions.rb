class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.integer :milliseconds
      t.references :user

      t.timestamps
    end
  end
end
