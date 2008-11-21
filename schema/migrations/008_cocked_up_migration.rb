class CockedUpMigration < ActiveRecord::Migration
  def self.up
    remove_column :votes, :proposed_date
    add_column :votes, :proposed_date_id, :integer
  end

  def self.down
    remove_column :votes, :proposed_date_id
    add_column :votes, :proposed_date, :integer
  end
end
