# frozen_string_literal: true

json.extract! myfriend, :id, :user_name, :first_name, :email, :created_at, :updated_at
json.url myfriend_url(myfriend, format: :json)
