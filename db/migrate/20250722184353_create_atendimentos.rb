class CreateAtendimentos < ActiveRecord::Migration[7.2]
  def change
    create_table :atendimentos do |t|
      t.references :paciente, null: false, foreign_key: true
      t.date :data_sessao
      t.text :resumo
      t.text :observacoes_comportamentais
      t.text :intervencoes_realizadas
      t.text :reacoes_paciente
      t.text :encaminhamentos
      t.text :planos_terapeuticos
      t.text :hipoteses_diagnosticas
      t.string :tecnica_utilizada
      t.timestamps
    end
  end
end
