class CreateWodGyms < ActiveRecord::Migration
  def change
    create_table :wod_gyms do |t|
      t.references :wod
      t.references :gym

      t.timestamps
    end
  end
end
