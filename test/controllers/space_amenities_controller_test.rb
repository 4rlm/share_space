require 'test_helper'

class SpaceAmenitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space_amenity = space_amenities(:one)
  end

  test "should get index" do
    get space_amenities_url
    assert_response :success
  end

  test "should get new" do
    get new_space_amenity_url
    assert_response :success
  end

  test "should create space_amenity" do
    assert_difference('SpaceAmenity.count') do
      post space_amenities_url, params: { space_amenity: { amenity_id: @space_amenity.amenity_id, space_id: @space_amenity.space_id } }
    end

    assert_redirected_to space_amenity_url(SpaceAmenity.last)
  end

  test "should show space_amenity" do
    get space_amenity_url(@space_amenity)
    assert_response :success
  end

  test "should get edit" do
    get edit_space_amenity_url(@space_amenity)
    assert_response :success
  end

  test "should update space_amenity" do
    patch space_amenity_url(@space_amenity), params: { space_amenity: { amenity_id: @space_amenity.amenity_id, space_id: @space_amenity.space_id } }
    assert_redirected_to space_amenity_url(@space_amenity)
  end

  test "should destroy space_amenity" do
    assert_difference('SpaceAmenity.count', -1) do
      delete space_amenity_url(@space_amenity)
    end

    assert_redirected_to space_amenities_url
  end
end
