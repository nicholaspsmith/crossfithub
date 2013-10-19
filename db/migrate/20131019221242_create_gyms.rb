class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :gym_name
      t.string :location

      t.timestamps
    end
  end
end
