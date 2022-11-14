# frozen_string_literal: true

class CreateMyfriends < ActiveRecord::Migration[7.0]
  def change
    create_table :myfriends do |t|
      t.string :user_name
      t.string :first_name
      t.string :email

      t.timestamps
    end
  end
end
