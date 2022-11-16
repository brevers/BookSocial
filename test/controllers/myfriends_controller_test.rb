# frozen_string_literal: true

require "test_helper"

class MyfriendsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @me = users(:jane)
    sign_in @me
    @myfriend = myfriends(:two)
    @my_new_friend = myfriends(:three)
  end

  test "should get index" do
    get myfriends_url
    assert_response :success
  end

  test "should get new" do
    get new_myfriend_url
    assert_response :success
  end

  test "should create myfriend" do
    assert_difference("@me.friends.count") do
      post myfriends_url, params: {
        myfriend: {
          email: @myfriend.email,
          first_name: @myfriend.first_name,
          user_name: @myfriend.user_name
        }
      }
    end

    assert_redirected_to myfriend_url(@me.friends.last)
  end

  test "should show myfriend" do
    get myfriend_url(@myfriend)
    assert_response :success
  end

  test "should get edit" do
    get edit_myfriend_url(@myfriend)
    assert_response :success
  end

  test "should update myfriend" do
    patch myfriend_url(@myfriend), params: { myfriend: { email: @myfriend.email, first_name: @myfriend.first_name, user_name: @myfriend.user_name } }
    assert_redirected_to myfriend_url(@myfriend)
  end

  test "should destroy myfriend" do
    assert_difference("Myfriend.count", -1) do
      delete myfriend_url(@myfriend)
    end

    assert_redirected_to myfriends_url
  end
end
