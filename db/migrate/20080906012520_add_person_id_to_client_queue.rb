class AddPersonIdToClientQueue < ActiveRecord::Migration
  def self.up
    add_column :client_queues, :person_id, :integer
    remove_column :client_queues, :client_id
  end

  def self.down
    add_column :client_queues, :client_id, :integer
    remove_column :client_queues, :person_id
  end
end
