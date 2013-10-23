class AddReferencesToVote < ActiveRecord::Migration
  def self.up
    change_table(:votes) do |t|
      t.references :completion
    end
  end
end
