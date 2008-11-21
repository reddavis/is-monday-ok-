class DateMigration < ActiveRecord::Migration
  def self.up
    create_table :proposed_dates do |t|
      t.string :name
      t.datetime :date
      t.timestamps
    end
  end

  def self.down
    drop_table :proposed_dates
  end
end
