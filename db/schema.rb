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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130206225053) do

  create_table "competencies", :force => true do |t|
    t.text     "statement",            :null => false
    t.integer  "level_description_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "evaluable_competencies", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "evaluation_criteria", :force => true do |t|
    t.integer  "learning_outcome_id", :null => false
    t.text     "statement",           :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "learning_outcomes", :force => true do |t|
    t.integer  "subject_id", :null => false
    t.text     "statement",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "level_descriptions", :force => true do |t|
    t.integer  "training_level_id",         :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.text     "main_competency"
    t.text     "european_benchmark"
    t.text     "professional_profile"
    t.text     "professional_environment"
    t.text     "relevant_jobs"
    t.text     "prospective_of_the_degree"
    t.string   "professional_family"
  end

  create_table "level_goals", :force => true do |t|
    t.text     "statement",            :null => false
    t.integer  "level_description_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "level_goals_subjects", :id => false, :force => true do |t|
    t.integer "subject_id"
    t.integer "level_goal_id"
  end

  add_index "level_goals_subjects", ["subject_id", "level_goal_id"], :name => "index_level_goals_subjects_on_subject_id_and_level_goal_id", :unique => true

  create_table "nuclear_activities", :force => true do |t|
    t.integer "task_id",   :null => false
    t.text    "statement"
  end

  create_table "qualifications", :force => true do |t|
    t.string   "code",                                    :null => false
    t.text     "statement",                               :null => false
    t.boolean  "partial",              :default => false
    t.integer  "level_description_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "qualifications_subjects", :id => false, :force => true do |t|
    t.integer "subject_id"
    t.integer "qualification_id"
  end

  add_index "qualifications_subjects", ["subject_id", "qualification_id"], :name => "index_qualifications_subjects_on_subject_id_and_qualification_id", :unique => true

  create_table "subject_competencies", :force => true do |t|
    t.integer  "competency_id", :null => false
    t.integer  "subject_id",    :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "title",                                                               :null => false
    t.string   "abbreviation",                                    :default => ""
    t.text     "description"
    t.integer  "training_level_id",                                                   :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.string   "url"
    t.string   "code",                                            :default => "0",    :null => false
    t.decimal  "value",             :precision => 6, :scale => 2, :default => 0.0
    t.string   "value_unit",                                      :default => "ECTS"
    t.integer  "teaching_hours",                                  :default => 0,      :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "learning_outcome_id", :null => false
    t.text     "statement"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "teaching_units", :force => true do |t|
    t.string   "title"
    t.integer  "subject_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "training_levels", :force => true do |t|
    t.string   "name",              :null => false
    t.text     "description"
    t.string   "short_name"
    t.integer  "parent_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "url"
  end

end
