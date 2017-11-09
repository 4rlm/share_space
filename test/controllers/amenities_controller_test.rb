require 'test_helper'

class AmenitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amenity = amenities(:one)
  end

  test "should get index" do
    get amenities_url
    assert_response :success
  end

  test "should get new" do
    get new_amenity_url
    assert_response :success
  end

  test "should create amenity" do
    assert_difference('Amenity.count') do
      post amenities_url, params: { amenity: { accessibility: @amenity.accessibility, bike_rack: @amenity.bike_rack, coffee: @amenity.coffee, computer: @amenity.computer, kitchen: @amenity.kitchen, locked_door: @amenity.locked_door, monitor: @amenity.monitor, parking: @amenity.parking, pet_friendly: @amenity.pet_friendly, phone: @amenity.phone, price: @amenity.price, printer: @amenity.printer, shower: @amenity.shower, tv: @amenity.tv, wifi: @amenity.wifi } }
    end

    assert_redirected_to amenity_url(Amenity.last)
  end

  test "should show amenity" do
    get amenity_url(@amenity)
    assert_response :success
  end

  test "should get edit" do
    get edit_amenity_url(@amenity)
    assert_response :success
  end

  test "should update amenity" do
    patch amenity_url(@amenity), params: { amenity: { accessibility: @amenity.accessibility, bike_rack: @amenity.bike_rack, coffee: @amenity.coffee, computer: @amenity.computer, kitchen: @amenity.kitchen, locked_door: @amenity.locked_door, monitor: @amenity.monitor, parking: @amenity.parking, pet_friendly: @amenity.pet_friendly, phone: @amenity.phone, price: @amenity.price, printer: @amenity.printer, shower: @amenity.shower, tv: @amenity.tv, wifi: @amenity.wifi } }
    assert_redirected_to amenity_url(@amenity)
  end

  test "should destroy amenity" do
    assert_difference('Amenity.count', -1) do
      delete amenity_url(@amenity)
    end

    assert_redirected_to amenities_url
  end
end
