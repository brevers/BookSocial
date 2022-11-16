# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # This is to create the association between Users and Friends, Each user has many Friends.1 to many relationship
  has_many :friends, class_name: "Myfriend", dependent: :destroy

  # This is to create the association between Users and profile, Each user has one profile. 1 to 1.
  has_one :profile, dependent: :destroy

  after_create :set_profile

  def set_profile
    # self.profile = Profile.create
    self.profile = Profile.create!(user: self)
  end
end