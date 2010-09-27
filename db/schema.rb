# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100925223908) do

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
    t.integer  "event_id"
  end

  add_index "addresses", ["event_id"], :name => "index_addresses_on_event_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "registration_open"
    t.boolean  "visible"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "code",                              :null => false
    t.string   "category",   :default => "General", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "ticket_id"
    t.float    "price_paid"
    t.integer  "purchaser_id"
    t.integer  "user_id"
    t.datetime "date_given"
    t.integer  "package_parent_id"
    t.boolean  "checked_in"
    t.datetime "date_checked_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tickets", :force => true do |t|
    t.integer  "event_id"
    t.float    "price"
    t.integer  "available"
    t.datetime "date_open"
    t.datetime "date_closed"
    t.boolean  "package"
    t.integer  "generates_ticket_id"
    t.integer  "generates_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                :default => "Registration for one person", :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.string   "handle"
    t.string   "email"
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
    t.string   "crypted_password",    :default => "",         :null => false
    t.boolean  "disabled",            :default => false,      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
