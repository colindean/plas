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

ActiveRecord::Schema.define(:version => 20100720023804) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "line3"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.string   "postcode"
    t.integer  "type"
    t.boolean  "primary"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.string   "handle"
    t.string   "email"
    t.string   "password"
    t.datetime "date"
    t.binary   "picture"
    t.boolean  "enabled"
    t.string   "gaming_group"
    t.datetime "date_arrival"
    t.datetime "date_departure"
    t.integer  "gamer_type"
    t.date     "birthdate"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt",       :default => "assalted", :null => false
    t.string   "persistence_token",   :default => "token",    :null => false
    t.string   "single_access_token", :default => "token",    :null => false
    t.string   "perishable_token",    :default => "token",    :null => false
    t.integer  "login_count",         :default => 0,          :null => false
    t.integer  "failed_login_count",  :default => 0,          :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

end
