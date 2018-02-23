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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180223123916) do

  create_table "exam_shares", force: :cascade do |t|
    t.integer "exam_id"
    t.string "share_digest"
    t.string "email"
    t.boolean "one_time_use", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_sheets", force: :cascade do |t|
    t.integer "exam_id"
    t.string "student_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "pass_limit_percent", default: 50
    t.integer "allowed_time_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_sheets", force: :cascade do |t|
    t.integer "choosen_answer"
    t.integer "question_id"
    t.integer "exam_sheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "first_answer"
    t.string "second_answer"
    t.string "third_answer"
    t.string "fourth_answer"
    t.integer "marks"
    t.integer "exam_id"
    t.integer "right_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.string "password_reset_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
