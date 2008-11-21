class AddRelationshipMigration < ActiveRecord::Migration
  def self.up
    add_column :proposed_dates, :appointment_id, :integer
    add_column :oks, :appointment_id, :integer
  end

  def self.down
    remove_column :oks, :appointment_id
    remove_column :proposed_dates, :appointment_id
  end
end
