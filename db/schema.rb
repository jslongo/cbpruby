# This file is auto-generated from the current state of the database. Instead of editing this file,
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.integer  "account_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "color"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.string   "description"
    t.integer  "account_id"
    t.integer  "category_id"
    t.date     "date"
    t.string   "itemno"
    t.float    "amount"
    t.boolean  "cleared"
    t.boolean  "fee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
