class DropVotesMigration < ActiveRecord::Migration
  def self.up
    drop_table :votes
  end

  def self.down
  end
end
