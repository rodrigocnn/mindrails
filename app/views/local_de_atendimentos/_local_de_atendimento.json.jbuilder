json.extract! local_de_atendimento, :id, :nome, :endereco, :bairro, :cidade, :estado, :created_at, :updated_at
json.url local_de_atendimento_url(local_de_atendimento, format: :json)
