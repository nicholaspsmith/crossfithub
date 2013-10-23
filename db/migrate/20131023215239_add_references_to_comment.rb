class AddReferencesToComment < ActiveRecord::Migration
  def self.up
    change_table(:comments) do |t|
      t.references :completion
    end
  end
end
