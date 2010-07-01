class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :alias
      t.string :public_name
      t.string :private_name
      t.string :public_ip
      t.string :private_ip
      t.string :type
      t.string :status
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
