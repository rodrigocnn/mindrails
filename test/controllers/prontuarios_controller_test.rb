require "test_helper"

class ProntuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prontuarios_index_url
    assert_response :success
  end
end
