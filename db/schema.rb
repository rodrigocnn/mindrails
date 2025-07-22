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

ActiveRecord::Schema[7.2].define(version: 2025_07_22_184353) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atendimentos", force: :cascade do |t|
    t.bigint "paciente_id", null: false
    t.date "data_sessao"
    t.text "resumo"
    t.text "observacoes_comportamentais"
    t.text "intervencoes_realizadas"
    t.text "reacoes_paciente"
    t.text "encaminhamentos"
    t.text "planos_terapeuticos"
    t.text "hipoteses_diagnosticas"
    t.string "tecnica_utilizada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_atendimentos_on_paciente_id"
  end

  create_table "local_de_atendimentos", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "email"
    t.string "telefone"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "atendimentos", "pacientes"
end
