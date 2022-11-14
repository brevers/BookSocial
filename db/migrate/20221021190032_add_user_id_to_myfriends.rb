# frozen_string_literal: true

class AddUserIdToMyfriends < ActiveRecord::Migration[7.0]
  def change
    add_column :myfriends, :user_id, :integer
    add_index :myfriends, :user_id
  end
end
