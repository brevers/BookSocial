# frozen_string_literal: true

class Myfriend < ApplicationRecord
  # This is to create the association between Users and Friends, Each user has diff Friends
  belongs_to :user
end
