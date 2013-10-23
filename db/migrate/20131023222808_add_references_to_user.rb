class AddReferencesToUser < ActiveRecord::Migration
  # def change
  #   add_reference :users, :completion, index: true
  #   add_reference :users, :vote, index: true
  #   add_reference :users, :comment, index: true
  # end

  def self.up
    change_table(:users) do |t|
      t.references :completion
      t.references :vote
      t.references :comment
    end
  end
end
