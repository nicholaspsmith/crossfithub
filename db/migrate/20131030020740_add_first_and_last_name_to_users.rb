class AddFirstAndLastNameToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :fname
      t.string :lname
    end
  end
end
