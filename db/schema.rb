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

ActiveRecord::Schema[7.0].define(version: 20_231_010_045_324) do
  create_table 'scraped_recruitments', force: :cascade do |t|
    t.text 'url'
    t.text 'html'
    t.string 'title'
    t.integer 'kind'
    t.text 'description'
    t.date 'deadline'
    t.string 'organization_name'
    t.string 'organization_email'
    t.integer 'organization_phone_number'
    t.text 'organization_hp'
    t.datetime 'last_crawled_at'
    t.datetime 'last_parsed_at'
    t.datetime 'last_confirmed_association_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
