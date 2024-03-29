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

ActiveRecord::Schema.define(:version => 20120421182850) do

  create_table "quizactivities", :force => true do |t|
    t.integer  "t_id"
    t.integer  "user_id"
    t.integer  "reason_id"
    t.boolean  "is_correct"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "quizzes", :force => true do |t|
    t.integer  "t_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reasons", :force => true do |t|
    t.integer  "t_id"
    t.string   "question"
    t.boolean  "question_approved"
    t.string   "title"
    t.text     "content"
    t.integer  "score"
    t.boolean  "is_pro"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "correct_answer"
    t.string   "wrong_answer1"
    t.string   "wrong_answer2"
    t.string   "wrong_answer3"
    t.string   "wrong_answer4"
  end

  create_table "scorings", :force => true do |t|
    t.integer  "reason_id"
    t.integer  "user_id"
    t.integer  "vote"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
