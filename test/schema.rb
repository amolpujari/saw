ActiveRecord::Schema.define(:version => 0) do
  create_table "users", :force => true do |t|
    t.string   "name"
  end

  create_table "visits", :force => true do |t|
    t.integer  "user_id"
    t.string   "session_id"
    t.string   "user_agent"
    t.string   "remote_host"
    t.datetime "created_at"
  end

  create_table "hits", :force => true do |t|
    t.integer  "visit_id"
    t.string   "url"
    t.string   "http_method"
    t.string   "action"
    t.text     "params"
    t.string   "note"
    t.text     "json_data"
    t.datetime "created_at"
  end
end