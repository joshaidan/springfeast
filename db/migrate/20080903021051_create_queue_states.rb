class CreateQueueStates < ActiveRecord::Migration
  def self.up
    create_table :queue_states do |t|
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :queue_states
  end
end
