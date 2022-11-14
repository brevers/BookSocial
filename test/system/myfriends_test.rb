# frozen_string_literal: true

require 'application_system_test_case'

class MyfriendsTest < ApplicationSystemTestCase
  setup do
    @myfriend = myfriends(:one)
  end

  test 'visiting the index' do
    visit myfriends_url
    assert_selector 'h1', text: 'Myfriends'
  end

  test 'should create myfriend' do
    visit myfriends_url
    click_on 'New myfriend'

    fill_in 'Email', with: @myfriend.email
    fill_in 'First name', with: @myfriend.first_name
    fill_in 'User name', with: @myfriend.user_name
    click_on 'Create Myfriend'

    assert_text 'Myfriend was successfully created'
    click_on 'Back'
  end

  test 'should update Myfriend' do
    visit myfriend_url(@myfriend)
    click_on 'Edit this myfriend', match: :first

    fill_in 'Email', with: @myfriend.email
    fill_in 'First name', with: @myfriend.first_name
    fill_in 'User name', with: @myfriend.user_name
    click_on 'Update Myfriend'

    assert_text 'Myfriend was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Myfriend' do
    visit myfriend_url(@myfriend)
    click_on 'Destroy this myfriend', match: :first

    assert_text 'Myfriend was successfully destroyed'
  end
end
