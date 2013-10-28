class AddWodIdToCompletions < ActiveRecord::Migration
  def change
    change_table(:completions) do |t|
      t.references :wod
    end
  end
end
