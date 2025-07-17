json.extract! paciente, :id, :nome, :data_nascimento, :email, :telefone, :cpf, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
