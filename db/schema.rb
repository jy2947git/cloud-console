# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100702204535) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "admin_name"
    t.string   "admin_phone"
    t.string   "admin_email"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_attributes", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", :force => true do |t|
    t.string   "alias",        :null => false
    t.string   "system_name"
    t.string   "public_name"
    t.string   "private_name"
    t.string   "public_ip"
    t.string   "private_ip"
    t.string   "type"
    t.string   "status"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
