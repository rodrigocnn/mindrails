class CreatePacientes < ActiveRecord::Migration[7.2]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :email
      t.string :telefone
      t.string :cpf

      t.timestamps
    end
  end
end
