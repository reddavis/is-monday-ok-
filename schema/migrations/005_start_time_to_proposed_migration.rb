class StartTimeToProposedMigration < ActiveRecord::Migration
  def self.up
    add_column :proposed_dates, :start_time, :string
  end

  def self.down
    remove_column :proposed_dates, :start_time
  end
end
