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

ActiveRecord::Schema.define(:version => 20120726014326) do

  create_table "favorites", :force => true do |t|
    t.integer  "favoriter_id"
    t.integer  "favoritee_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "favorites", ["favoriter_id", "favoritee_id"], :name => "index_favorites_on_favoriter_id_and_favoritee_id", :unique => true

  create_table "photos", :force => true do |t|
    t.integer  "profile_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "caption"
    t.boolean  "primary",             :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "private_messages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "conversation_id"
  end

  create_table "profiles", :force => true do |t|
    t.text     "about_me"
    t.text     "message_me_if"
    t.text     "good_at"
    t.string   "relationship_status"
    t.integer  "age"
    t.string   "sex"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "body_type",           :default => "no answer"
    t.integer  "height",              :default => 65
    t.string   "ethnicity",           :default => "no answer"
    t.string   "smokes",              :default => "no answer"
    t.string   "drinks",              :default => "no answer"
    t.string   "religion",            :default => "no answer"
    t.string   "income",              :default => "no answer"
    t.string   "job",                 :default => "no answer"
    t.string   "language",            :default => "no answer"
    t.string   "drugs",               :default => "no answer"
    t.string   "offspring",           :default => "no answer"
    t.string   "exercise",            :default => "no answer"
    t.integer  "zip_code"
    t.string   "nick_name"
    t.string   "interested_in"
    t.string   "zipcode"
    t.string   "formatted_height"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "hidden",              :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "admin",           :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "profile_id"
    t.string   "nick_name"
  end

  create_table "winks", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "winks", ["sender_id", "receiver_id"], :name => "index_winks_on_sender_id_and_receiver_id", :unique => true

end
