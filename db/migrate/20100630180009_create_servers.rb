class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :alias, :null => false
      t.string :system_name, :null=>true
      t.string :public_name, :null => true
      t.string :private_name, :null => true
      t.string :public_ip, :null => true
      t.string :private_ip, :null => true
      t.string :type, :null => true
      t.string :status, :null => true
      t.string :image, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
