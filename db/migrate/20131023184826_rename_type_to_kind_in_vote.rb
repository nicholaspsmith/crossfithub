class RenameTypeToKindInVote < ActiveRecord::Migration
  def change
    rename_column :votes, :type, :kind
  end
end
