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

ActiveRecord::Schema.define(version: 2018_11_08_102853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insights", force: :cascade do |t|
    t.string "name"
    t.string "certainty"
    t.text "description"
    t.text "successes"
    t.text "improvements"
    t.text "learnings"
    t.text "notes"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_insights_on_section_id"
  end

  create_table "playbacks", force: :cascade do |t|
    t.string "organisation_name"
    t.string "project_name"
    t.string "author_name"
    t.string "period"
    t.string "logo_url"
    t.text "description"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "playback_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playback_id"], name: "index_sections_on_playback_id"
  end

  create_table "steps", force: :cascade do |t|
    t.text "name"
    t.bigint "insight_id"
    t.date "due_on"
    t.date "completed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insight_id"], name: "index_steps_on_insight_id"
  end

  add_foreign_key "insights", "sections"
  add_foreign_key "sections", "playbacks"
  add_foreign_key "steps", "insights"
end
