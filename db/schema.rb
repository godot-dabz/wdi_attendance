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
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150218154102) do
=======
ActiveRecord::Schema.define(version: 20150218225331) do
>>>>>>> 0d946074c8897a4b96cec6d527b7db83c1da464f

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.string   "email",              null: false
    t.date     "late"
    t.date     "unexcused_absences"
    t.date     "excused_absences"
<<<<<<< HEAD
=======
    t.integer  "student_id"
>>>>>>> 0d946074c8897a4b96cec6d527b7db83c1da464f
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "type"
    t.string   "password_digest"
=======
  create_table "cohorts", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "email",          null: false
    t.string   "type"
    t.integer  "cohort_id"
    t.integer  "producer_id"
    t.integer  "instructors_id"
>>>>>>> 0d946074c8897a4b96cec6d527b7db83c1da464f
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
