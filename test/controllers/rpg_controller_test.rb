require "test_helper"

class RpgControllerTest < ActionDispatch::IntegrationTest
  test "should get farm" do
    get rpg_farm_url
    assert_response :success
  end

  test "should get cave" do
    get rpg_cave_url
    assert_response :success
  end

  test "should get casino" do
    get rpg_casino_url
    assert_response :success
  end

  test "should get house" do
    get rpg_house_url
    assert_response :success
  end
end
