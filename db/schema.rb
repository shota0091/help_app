# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_18_021205) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "user_id"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "following_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id"], name: "index_likes_on_follower_id"
    t.index ["following_id"], name: "index_likes_on_following_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.text "messages"
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "visitor_id", null: false
    t.bigint "visited_id", null: false
    t.bigint "room_id"
    t.bigint "message_id"
    t.string "action"
    t.boolean "cheaked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["room_id"], name: "index_notifications_on_room_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "post_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "explanation", null: false
    t.string "image", null: false
    t.string "obtain", null: false
    t.integer "address_id", null: false
    t.integer "license_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "solution"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "speedy"
    t.integer "kindness"
    t.integer "frantically"
    t.bigint "reviewer_id", null: false
    t.bigint "reviewing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
    t.index ["reviewing_id"], name: "index_reviews_on_reviewing_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_name"], name: "index_tags_on_tag_name", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "image"
    t.string "explanation"
    t.integer "address_id"
    t.string "name", null: false
    t.integer "age", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "entries", "rooms"
  add_foreign_key "entries", "users"
  add_foreign_key "likes", "users", column: "follower_id"
  add_foreign_key "likes", "users", column: "following_id"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "messages"
  add_foreign_key "notifications", "rooms"
  add_foreign_key "notifications", "users", column: "visited_id"
  add_foreign_key "notifications", "users", column: "visitor_id"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
  add_foreign_key "posts", "users"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "reviews", "users", column: "reviewing_id"
end
