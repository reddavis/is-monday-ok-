class AddStartTimeMigration < ActiveRecord::Migration
  def self.up
    add_column :appointments, :start_time, :string
  end

  def self.down
    remove_column :appointsments, :start_time
  end
end
