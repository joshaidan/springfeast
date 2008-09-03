class CreateQueues < ActiveRecord::Migration
  def self.up
    create_table :queues do |t|
      t.date :date
      t.integer :client_id
      t.integer :state, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :queues
  end
end
