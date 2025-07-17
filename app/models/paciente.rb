class Paciente < ApplicationRecord
  validates :nome, :data_nascimento, :telefone, :cpf, presence: true
end


