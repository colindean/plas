# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120824040708) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "line3"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.string   "postcode"
    t.boolean  "primary"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "event_id"
    t.string   "address_type"
  end

  add_index "addresses", ["event_id"], :name => "index_addresses_on_event_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "registration_open"
    t.boolean  "visible"
    t.text     "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "waiver_id"
  end

  create_table "pcfgs", :force => true do |t|
    t.text     "key"
    t.text     "value"
    t.integer  "last_modified_by_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "permission_to_user_groups", :force => true do |t|
    t.integer  "permission_id"
    t.integer  "user_group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "code",                              :null => false
    t.string   "category",   :default => "General", :null => false
    t.integer  "parent_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "plas_tournaments", :force => true do |t|
    t.string   "name"
    t.integer  "winner_id"
    t.integer  "creator_id"
    t.integer  "max_participants"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "plas_tournaments", ["creator_id"], :name => "index_plas_tournaments_on_creator_id"
  add_index "plas_tournaments", ["winner_id"], :name => "index_plas_tournaments_on_winner_id"

  create_table "registration_gift_logs", :force => true do |t|
    t.integer  "registration_id"
    t.integer  "to_user_id"
    t.integer  "from_user_id"
    t.integer  "by_user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "registration_transfers", :force => true do |t|
    t.integer  "to_user_id"
    t.integer  "from_user_id"
    t.integer  "by_user_id"
    t.integer  "registration_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "ticket_id"
    t.float    "paid_cents"
    t.integer  "purchaser_id"
    t.integer  "user_id"
    t.datetime "date_given"
    t.integer  "package_parent_id"
    t.boolean  "checked_in"
    t.datetime "date_checked_in"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "transaction_id"
    t.string   "paid_currency",     :default => "USD"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shouts", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shouts", ["user_id"], :name => "index_shouts_on_user_id"

  create_table "tickets", :force => true do |t|
    t.integer  "event_id"
    t.float    "cents"
    t.integer  "available"
    t.datetime "date_open"
    t.datetime "date_closed"
    t.boolean  "package"
    t.integer  "generates_ticket_id"
    t.integer  "generates_number"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.string   "name",                :default => "Registration for one person", :null => false
    t.string   "currency"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "max_participants"
    t.integer  "event_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "remote_type"
    t.integer  "remote_id"
  end

  add_index "tournaments", ["event_id"], :name => "index_tournaments_on_event_id"

  create_table "transactions", :force => true do |t|
    t.integer  "address_id"
    t.string   "email"
    t.string   "payer_name"
    t.string   "payer_country"
    t.string   "processor_userid"
    t.string   "payment_id"
    t.integer  "recorded_by_id"
    t.integer  "cents"
    t.text     "comments"
    t.integer  "registration_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "payment_media"
    t.string   "currency",         :default => "USD"
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_to_user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "handle"
    t.string   "email"
    t.date     "birthdate"
    t.string   "gender"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
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
    t.string   "name"
    t.string   "pronunciation"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "waivers", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
