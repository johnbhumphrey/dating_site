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

ActiveRecord::Schema.define(:version => 20120805181832) do

  create_table "favorites", :force => true do |t|
    t.integer  "favoriter_id"
    t.integer  "favoritee_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "favorites", ["favoriter_id", "favoritee_id"], :name => "index_favorites_on_favoriter_id_and_favoritee_id", :unique => true

  create_table "hiddens", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "hiddens", ["sender_id", "receiver_id"], :name => "index_hiddens_on_sender_id_and_receiver_id", :unique => true

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
    t.boolean  "new_user"
    t.integer  "photos_count"
  end

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "min_height"
    t.integer  "max_height"
    t.string   "sex"
    t.string   "relationship_status"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "interested_in"
    t.boolean  "save_search",         :default => false
    t.integer  "profile_id"
  end

  add_index "searches", ["save_search"], :name => "index_searches_on_save_search"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "admin",           :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "nick_name"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "views", :force => true do |t|
    t.integer  "viewer_id"
    t.integer  "viewed_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "views", ["viewed_id"], :name => "index_views_on_viewed_id"
  add_index "views", ["viewer_id"], :name => "index_views_on_viewer_id"

  create_table "winks", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "winks", ["sender_id", "receiver_id"], :name => "index_winks_on_sender_id_and_receiver_id", :unique => true

end
