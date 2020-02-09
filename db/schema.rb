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

ActiveRecord::Schema.define(version: 2020_02_08_222532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "action_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.integer "order"
    t.string "description"
    t.date "due_date"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_action_items_on_discarded_at"
    t.index ["organization_id"], name: "index_action_items_on_organization_id"
    t.index ["user_id"], name: "index_action_items_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "checkpoints", force: :cascade do |t|
    t.date "date"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "comment_id"
    t.integer "status"
    t.index ["comment_id"], name: "index_checkpoints_on_comment_id"
    t.index ["event_id"], name: "index_checkpoints_on_event_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "competitors", force: :cascade do |t|
    t.integer "player_id"
    t.integer "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configuration_mappings", force: :cascade do |t|
    t.string "resource"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_field"
    t.bigint "metric_id"
    t.jsonb "fields", default: [], array: true
    t.jsonb "conditions", default: [], array: true
    t.jsonb "functions", default: [], array: true
    t.string "template"
    t.index ["metric_id"], name: "index_configuration_mappings_on_metric_id"
  end

  create_table "dashboard_section_metrics", force: :cascade do |t|
    t.bigint "dashboard_section_id"
    t.bigint "metric_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_expanded"
    t.index ["dashboard_section_id"], name: "index_dashboard_section_metrics_on_dashboard_section_id"
    t.index ["metric_id"], name: "index_dashboard_section_metrics_on_metric_id"
  end

  create_table "dashboard_sections", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["organization_id"], name: "index_dashboard_sections_on_organization_id"
  end

  create_table "event_metrics", force: :cascade do |t|
    t.bigint "metric_id"
    t.bigint "event_id"
    t.jsonb "conditions", default: [], array: true
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_primary"
    t.integer "graph_type", default: 0
    t.integer "number_format", default: 0
    t.index ["event_id"], name: "index_event_metrics_on_event_id"
    t.index ["metric_id"], name: "index_event_metrics_on_metric_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "organization_id"
    t.bigint "scenario_id"
    t.bigint "group_id"
    t.datetime "end_date"
    t.string "description"
    t.datetime "completed_at"
    t.bigint "parent_id"
    t.bigint "owner_id"
    t.datetime "discarded_at"
    t.integer "approval_status", default: 0
    t.integer "visibility", default: 0
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["owner_id"], name: "index_events_on_owner_id"
    t.index ["parent_id"], name: "index_events_on_parent_id"
    t.index ["scenario_id"], name: "index_events_on_scenario_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "players"
    t.string "genre"
    t.integer "max_score"
  end

  create_table "goals", force: :cascade do |t|
    t.float "target_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trackable_id"
    t.string "trackable_type"
    t.datetime "end_time"
    t.float "current_value"
    t.datetime "start_time"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "parent_id"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["organization_id"], name: "index_groups_on_organization_id"
    t.index ["owner_id"], name: "index_groups_on_owner_id"
    t.index ["parent_id"], name: "index_groups_on_parent_id"
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.string "title"
    t.string "description"
    t.integer "priority"
    t.integer "order"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.index ["discarded_at"], name: "index_issues_on_discarded_at"
    t.index ["event_id"], name: "index_issues_on_event_id"
    t.index ["organization_id"], name: "index_issues_on_organization_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "match_competitors", force: :cascade do |t|
    t.integer "match_id"
    t.integer "competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.integer "team"
    t.integer "points", default: 0
  end

  create_table "matches", force: :cascade do |t|
    t.integer "game_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tournament_id"
    t.datetime "end_time"
    t.boolean "hidden"
    t.string "score_type"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "display_name"
    t.bigint "organization_id"
    t.integer "number_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "key"
    t.boolean "hidden", default: false
    t.bigint "plugin_configuration_id"
    t.integer "graph_type", default: 0
    t.datetime "discarded_at"
    t.integer "goal_direction"
    t.bigint "owner_id"
    t.index ["organization_id", "key"], name: "index_metrics_on_organization_id_and_key", unique: true
    t.index ["organization_id"], name: "index_metrics_on_organization_id"
    t.index ["owner_id"], name: "index_metrics_on_owner_id"
    t.index ["plugin_configuration_id"], name: "index_metrics_on_plugin_configuration_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "notifier_id"
    t.boolean "acknowledged", default: false
    t.string "notifiable_type"
    t.integer "notifiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "detail"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["notifier_id"], name: "index_notifications_on_notifier_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fiscal_year_start", default: "01-01"
    t.float "attainment"
    t.boolean "has_onboarded"
    t.integer "checkpoint_day", default: 1
    t.boolean "show_neutral", default: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "steam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.bigint "active_tournament_id"
    t.index ["active_tournament_id"], name: "index_players_on_active_tournament_id"
  end

  create_table "plugin_configurations", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "encrypted_credentials"
    t.string "encrypted_credentials_iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target"
    t.string "external_company_id"
    t.boolean "disabled", default: false
    t.index ["organization_id"], name: "index_plugin_configurations_on_organization_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "message"
    t.integer "variant"
    t.datetime "end_time"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "metric_id"
    t.string "title"
    t.index ["metric_id"], name: "index_recommendations_on_metric_id"
    t.index ["organization_id"], name: "index_recommendations_on_organization_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.integer "level"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_roles_on_group_id"
    t.index ["organization_id"], name: "index_roles_on_organization_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "scenarios", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "name"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_scenarios_on_organization_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "game_id"
    t.integer "position"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "position"], name: "index_scores_on_game_id_and_position", unique: true
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "locked", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "encrypted_password_reset_token"
    t.string "encrypted_password_reset_token_iv"
    t.datetime "password_reset_expiry"
    t.boolean "is_admin", default: false
    t.datetime "last_login"
    t.bigint "active_organization_id"
    t.string "color"
    t.string "first_name"
    t.string "last_name"
    t.index ["active_organization_id"], name: "index_users_on_active_organization_id"
  end

  add_foreign_key "action_items", "organizations"
  add_foreign_key "action_items", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "checkpoints", "comments"
  add_foreign_key "checkpoints", "events"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "configuration_mappings", "metrics"
  add_foreign_key "dashboard_section_metrics", "dashboard_sections"
  add_foreign_key "dashboard_section_metrics", "metrics"
  add_foreign_key "dashboard_sections", "organizations"
  add_foreign_key "event_metrics", "events"
  add_foreign_key "event_metrics", "metrics"
  add_foreign_key "events", "events", column: "parent_id"
  add_foreign_key "events", "groups"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "scenarios"
  add_foreign_key "events", "users", column: "owner_id"
  add_foreign_key "groups", "groups", column: "parent_id"
  add_foreign_key "groups", "organizations"
  add_foreign_key "groups", "users", column: "owner_id"
  add_foreign_key "issues", "events"
  add_foreign_key "issues", "organizations"
  add_foreign_key "issues", "users"
  add_foreign_key "metrics", "organizations"
  add_foreign_key "metrics", "plugin_configurations"
  add_foreign_key "metrics", "users", column: "owner_id"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "notifier_id"
  add_foreign_key "players", "tournaments", column: "active_tournament_id"
  add_foreign_key "plugin_configurations", "organizations"
  add_foreign_key "recommendations", "metrics"
  add_foreign_key "recommendations", "organizations"
  add_foreign_key "roles", "groups"
  add_foreign_key "roles", "organizations"
  add_foreign_key "roles", "users"
  add_foreign_key "scenarios", "organizations"
  add_foreign_key "users", "organizations", column: "active_organization_id"
end
