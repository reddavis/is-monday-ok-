class AppointmentMigration < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.string :stub
      t.string :event_name
      t.datetime :date
      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
