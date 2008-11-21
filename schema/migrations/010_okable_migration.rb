class OkableMigration < ActiveRecord::Migration
  def self.up
    remove_column :oks, :appointment_id
    add_column :oks, :okable_type, :string
    add_column :oks, :okable_id, :integer
  end

  def self.down
  end
end
