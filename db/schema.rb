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

ActiveRecord::Schema.define(:version => 20120102014846) do

  create_table "access_tokens", :force => true do |t|
    t.string   "provider",   :null => false
    t.string   "uid"
    t.string   "token",      :null => false
    t.string   "secret"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "access_tokens", ["hero_id"], :name => "index_access_tokens_on_hero_id"

  create_table "heros", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.text     "avatar_url"
    t.string   "gravatar_id"
    t.string   "name"
    t.string   "company"
    t.string   "blog"
    t.string   "location"
    t.boolean  "hireable"
    t.text     "bio"
    t.integer  "public_repos"
    t.integer  "public_gists"
    t.integer  "followers"
    t.integer  "following"
    t.string   "html_url"
    t.datetime "joined_github_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_received",                        :default => 0
  end

  add_index "heros", ["votes_received"], :name => "desc_votes_recvd_idx"

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "votee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votee_id"], :name => "index_votes_on_votee_id"
  add_index "votes", ["voter_id"], :name => "index_votes_on_voter_id"

end
