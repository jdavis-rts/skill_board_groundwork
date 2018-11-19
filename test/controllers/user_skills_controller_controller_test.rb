require 'test_helper'

class UserSkillsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_skills_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get user_skills_controller_show_url
    assert_response :success
  end

  test "should get create" do
    get user_skills_controller_create_url
    assert_response :success
  end

  test "should get update" do
    get user_skills_controller_update_url
    assert_response :success
  end

  test "should get delete" do
    get user_skills_controller_delete_url
    assert_response :success
  end

end
