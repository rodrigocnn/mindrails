class CreateLocalDeAtendimentos < ActiveRecord::Migration[7.2]
  def change
    create_table :local_de_atendimentos do |t|
      t.string :nome
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end
