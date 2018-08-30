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

ActiveRecord::Schema.define(version: 2018_08_30_141935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engagements", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "role_id"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.bigint "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["project_id"], name: "index_engagements_on_project_id"
    t.index ["role_id"], name: "index_engagements_on_role_id"
    t.index ["staff_id"], name: "index_engagements_on_staff_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "client_id"
    t.string "code", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_role_suitabilities", force: :cascade do |t|
    t.bigint "staff_id"
    t.bigint "role_id"
    t.integer "suitability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_staff_role_suitabilities_on_role_id"
    t.index ["staff_id"], name: "index_staff_role_suitabilities_on_staff_id"
  end

  create_table "staff_skill_levels", force: :cascade do |t|
    t.bigint "staff_id"
    t.bigint "skill_id"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_staff_skill_levels_on_skill_id"
    t.index ["staff_id"], name: "index_staff_skill_levels_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.bigint "grade_id"
    t.index ["grade_id"], name: "index_staffs_on_grade_id"
    t.index ["team_id"], name: "index_staffs_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "engagements", "projects"
  add_foreign_key "engagements", "roles"
  add_foreign_key "engagements", "staffs"
  add_foreign_key "staff_role_suitabilities", "roles"
  add_foreign_key "staff_role_suitabilities", "staffs"
  add_foreign_key "staff_skill_levels", "skills"
  add_foreign_key "staff_skill_levels", "staffs"
  add_foreign_key "staffs", "grades"
  add_foreign_key "staffs", "teams"
end
