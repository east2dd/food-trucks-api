# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_12_192320) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trucks", force: :cascade do |t|
    t.integer "locationid"
    t.string "applicant"
    t.string "facilitytype"
    t.string "cnn"
    t.string "locationdescription"
    t.string "address"
    t.string "blocklott"
    t.string "block"
    t.string "lot"
    t.string "permit"
    t.string "status"
    t.string "fooditems"
    t.float "x"
    t.float "y"
    t.float "latitude"
    t.float "longitude"
    t.string "schedule"
    t.string "dayshours"
    t.string "noisent"
    t.datetime "approved"
    t.string "received"
    t.integer "priorpermit"
    t.datetime "expirationdate"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
