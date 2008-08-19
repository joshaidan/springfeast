class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :client_id
      t.integer :type
      t.integer :age
      t.string :identification

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
