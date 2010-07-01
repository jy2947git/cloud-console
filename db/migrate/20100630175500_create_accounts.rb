class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :full_name
      t.string :admin_name
      t.string :admin_phone
      t.string :admin_email
      t.integer :server_id, :null => true
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
