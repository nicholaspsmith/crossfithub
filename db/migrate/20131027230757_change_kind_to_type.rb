class ChangeKindToType < ActiveRecord::Migration
  def self.up
    # alter table users change column 'kind' to integer
    execute "ALTER TABLE votes ALTER COLUMN kind TYPE integer USING CASE kind WHEN 'High-Five' THEN 1 WHEN 'Shame' THEN 2 ELSE 0 END"
  end

  def self.down
    # alter table users change column 'kind' to string
    change_column(:votes, :kind, :string)
  end
end
