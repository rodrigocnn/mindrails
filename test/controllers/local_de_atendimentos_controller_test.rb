require "test_helper"

class LocalDeAtendimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @local_de_atendimento = local_de_atendimentos(:one)
  end

  test "should get index" do
    get local_de_atendimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_local_de_atendimento_url
    assert_response :success
  end

  test "should create local_de_atendimento" do
    assert_difference("LocalDeAtendimento.count") do
      post local_de_atendimentos_url, params: { local_de_atendimento: { bairro: @local_de_atendimento.bairro, cidade: @local_de_atendimento.cidade, endereco: @local_de_atendimento.endereco, estado: @local_de_atendimento.estado, nome: @local_de_atendimento.nome } }
    end

    assert_redirected_to local_de_atendimento_url(LocalDeAtendimento.last)
  end

  test "should show local_de_atendimento" do
    get local_de_atendimento_url(@local_de_atendimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_local_de_atendimento_url(@local_de_atendimento)
    assert_response :success
  end

  test "should update local_de_atendimento" do
    patch local_de_atendimento_url(@local_de_atendimento), params: { local_de_atendimento: { bairro: @local_de_atendimento.bairro, cidade: @local_de_atendimento.cidade, endereco: @local_de_atendimento.endereco, estado: @local_de_atendimento.estado, nome: @local_de_atendimento.nome } }
    assert_redirected_to local_de_atendimento_url(@local_de_atendimento)
  end

  test "should destroy local_de_atendimento" do
    assert_difference("LocalDeAtendimento.count", -1) do
      delete local_de_atendimento_url(@local_de_atendimento)
    end

    assert_redirected_to local_de_atendimentos_url
  end
end
