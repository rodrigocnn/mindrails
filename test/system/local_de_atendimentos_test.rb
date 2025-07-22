require "application_system_test_case"

class LocalDeAtendimentosTest < ApplicationSystemTestCase
  setup do
    @local_de_atendimento = local_de_atendimentos(:one)
  end

  test "visiting the index" do
    visit local_de_atendimentos_url
    assert_selector "h1", text: "Local de atendimentos"
  end

  test "should create local de atendimento" do
    visit local_de_atendimentos_url
    click_on "New local de atendimento"

    fill_in "Bairro", with: @local_de_atendimento.bairro
    fill_in "Cidade", with: @local_de_atendimento.cidade
    fill_in "Endereco", with: @local_de_atendimento.endereco
    fill_in "Estado", with: @local_de_atendimento.estado
    fill_in "Nome", with: @local_de_atendimento.nome
    click_on "Create Local de atendimento"

    assert_text "Local de atendimento was successfully created"
    click_on "Back"
  end

  test "should update Local de atendimento" do
    visit local_de_atendimento_url(@local_de_atendimento)
    click_on "Edit this local de atendimento", match: :first

    fill_in "Bairro", with: @local_de_atendimento.bairro
    fill_in "Cidade", with: @local_de_atendimento.cidade
    fill_in "Endereco", with: @local_de_atendimento.endereco
    fill_in "Estado", with: @local_de_atendimento.estado
    fill_in "Nome", with: @local_de_atendimento.nome
    click_on "Update Local de atendimento"

    assert_text "Local de atendimento was successfully updated"
    click_on "Back"
  end

  test "should destroy Local de atendimento" do
    visit local_de_atendimento_url(@local_de_atendimento)
    accept_confirm { click_on "Destroy this local de atendimento", match: :first }

    assert_text "Local de atendimento was successfully destroyed"
  end
end
