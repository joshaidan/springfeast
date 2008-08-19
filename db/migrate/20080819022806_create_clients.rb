class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
