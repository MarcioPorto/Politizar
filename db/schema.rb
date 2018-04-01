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

ActiveRecord::Schema.define(version: 20180401005543) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "super_admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bills", force: :cascade do |t|
    t.string "identifier"
    t.text "description"
    t.date "vote_date"
    t.string "result"
    t.text "result_description"
    t.integer "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_bills_on_institution_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "member"
    t.string "member_plural"
    t.index ["country_id"], name: "index_institutions_on_country_id"
    t.index ["region_id"], name: "index_institutions_on_region_id"
  end

  create_table "mailkick_opt_outs", force: :cascade do |t|
    t.string "email"
    t.integer "subscriber_id"
    t.string "subscriber_type"
    t.boolean "active", default: true, null: false
    t.string "reason"
    t.string "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_mailkick_opt_outs_on_email"
    t.index ["subscriber_id", "subscriber_type"], name: "index_mailkick_opt_outs_on_subscriber_id_and_subscriber_type"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_parties_on_country_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.integer "representative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identifier"
    t.index ["representative_id"], name: "index_projects_on_representative_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abbreviation"
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "representatives", force: :cascade do |t|
    t.string "identifier"
    t.string "name"
    t.string "full_name"
    t.string "gender"
    t.string "photo"
    t.string "email"
    t.integer "total_sessions"
    t.integer "present_sessions"
    t.integer "justified_absences"
    t.integer "unjustified_absences"
    t.string "last_presence_update"
    t.integer "party_id"
    t.integer "region_id"
    t.integer "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_representatives_on_institution_id"
    t.index ["party_id"], name: "index_representatives_on_party_id"
    t.index ["region_id"], name: "index_representatives_on_region_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_subscribers_on_region_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "description"
    t.integer "bill_id"
    t.integer "representative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_votes_on_bill_id"
    t.index ["representative_id"], name: "index_votes_on_representative_id"
  end

end
