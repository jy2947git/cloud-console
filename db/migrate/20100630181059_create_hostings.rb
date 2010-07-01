class CreateHostings < ActiveRecord::Migration
  def self.up
    create_table :hostings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :hostings
  end
end
