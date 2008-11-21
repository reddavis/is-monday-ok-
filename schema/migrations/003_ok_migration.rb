class OkMigration < ActiveRecord::Migration
  def self.up
    create_table :oks do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :oks
  end
end
