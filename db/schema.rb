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

ActiveRecord::Schema.define(version: 20180324143220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "title"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.text "address"
    t.string "phone"
    t.string "officeno"
    t.string "role"
    t.string "hname"
    t.string "password_digest"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "auth_token"
    t.string "administartor_token"
    t.string "hospital_token"
    t.string "administrator_token"
    t.index ["hospital_id"], name: "index_administrators_on_hospital_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "title"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.text "address"
    t.string "phone"
    t.string "wardno"
    t.string "roomno"
    t.string "role"
    t.string "specialisation"
    t.string "hname"
    t.string "password_digest"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ward_id"
    t.string "wname"
    t.string "dname"
    t.string "auth_token"
    t.string "doctor_token"
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
    t.index ["ward_id"], name: "index_doctors_on_ward_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "hname"
    t.string "htellphone"
    t.string "haddress1"
    t.string "haddress2"
    t.string "haddress3"
    t.string "haddresscode"
    t.string "haddress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "hospital_token"
  end

  create_table "nurses", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "title"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.text "address"
    t.string "phone"
    t.string "wardno"
    t.string "roomno"
    t.string "role"
    t.string "specialisation"
    t.string "hname"
    t.string "password_digest"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ward_id"
    t.string "wname"
    t.string "auth_token"
    t.string "nurse_token"
    t.index ["hospital_id"], name: "index_nurses_on_hospital_id"
    t.index ["ward_id"], name: "index_nurses_on_ward_id"
  end

  create_table "patientrecords", force: :cascade do |t|
    t.integer "age"
    t.string "heartrate"
    t.decimal "weight"
    t.text "illness"
    t.text "prescription"
    t.boolean "drugcollected"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bd"
    t.string "bp"
    t.datetime "consultation"
    t.string "auth_token"
    t.index ["patient_id"], name: "index_patientrecords_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.datetime "birthdate"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.text "address"
    t.string "title"
    t.datetime "consutation"
    t.string "phone"
    t.string "bloodtype"
    t.string "nextname"
    t.string "nextphone"
    t.string "nextaddress1"
    t.string "nextaddress2"
    t.string "nextaddress3"
    t.string "nextaddress4"
    t.text "nextaddress"
    t.string "ralationship"
    t.bigint "hospital_id"
    t.bigint "ward_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hname"
    t.string "wname"
    t.string "dname"
    t.string "status"
    t.string "attachment"
    t.string "auth_token"
    t.string "patient_token"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
    t.index ["hospital_id"], name: "index_patients_on_hospital_id"
    t.index ["ward_id"], name: "index_patients_on_ward_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "pharmacyname"
    t.string "pahrmacyno"
    t.string "wardno"
    t.string "hname"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ward_id"
    t.string "wname"
    t.string "auth_token"
    t.string "pharmacy_token"
    t.index ["hospital_id"], name: "index_pharmacies_on_hospital_id"
    t.index ["ward_id"], name: "index_pharmacies_on_ward_id"
  end

  create_table "pharmacists", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "title"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.text "address"
    t.string "phone"
    t.string "wardno"
    t.string "pharmacyno"
    t.string "role"
    t.string "hname"
    t.string "password_digest"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wname"
    t.bigint "ward_id"
    t.bigint "pharmacy_id"
    t.string "pharmacyname"
    t.string "auth_token"
    t.string "pharmacist_token"
    t.index ["hospital_id"], name: "index_pharmacists_on_hospital_id"
    t.index ["pharmacy_id"], name: "index_pharmacists_on_pharmacy_id"
    t.index ["ward_id"], name: "index_pharmacists_on_ward_id"
  end

  create_table "pharmacyrecords", force: :cascade do |t|
    t.boolean "collected"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lname"
    t.string "fname"
    t.integer "pid"
    t.integer "prid"
    t.text "prescription"
    t.datetime "consultation"
    t.string "auth_token"
    t.string "pharmacyrecord_token"
    t.index ["hospital_id"], name: "index_pharmacyrecords_on_hospital_id"
  end

  create_table "receptionists", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "title"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.text "address"
    t.string "phone"
    t.string "wardno"
    t.string "roomno"
    t.string "role"
    t.string "hname"
    t.string "password_digest"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ward_id"
    t.string "wname"
    t.string "auth_token"
    t.string "receptionist_token"
    t.index ["hospital_id"], name: "index_receptionists_on_hospital_id"
    t.index ["ward_id"], name: "index_receptionists_on_ward_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "wname"
    t.string "wardno"
    t.string "hname"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "ward_token"
    t.index ["hospital_id"], name: "index_wards_on_hospital_id"
  end

  add_foreign_key "administrators", "hospitals"
  add_foreign_key "doctors", "hospitals"
  add_foreign_key "doctors", "wards"
  add_foreign_key "nurses", "hospitals"
  add_foreign_key "nurses", "wards"
  add_foreign_key "patientrecords", "patients"
  add_foreign_key "patients", "doctors"
  add_foreign_key "patients", "hospitals"
  add_foreign_key "patients", "wards"
  add_foreign_key "pharmacies", "hospitals"
  add_foreign_key "pharmacies", "wards"
  add_foreign_key "pharmacists", "hospitals"
  add_foreign_key "pharmacists", "pharmacies"
  add_foreign_key "pharmacists", "wards"
  add_foreign_key "pharmacyrecords", "hospitals"
  add_foreign_key "receptionists", "hospitals"
  add_foreign_key "receptionists", "wards"
  add_foreign_key "wards", "hospitals"
end
