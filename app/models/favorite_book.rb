class FavoriteBook < ApplicationRecord
  belongs_to :profile
  belongs_to :book
end
