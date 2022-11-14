# frozen_string_literal: true

class Profile < ApplicationRecord
  # validates :name, presence: true

  belongs_to :user
  has_many :profile_favorite_books, dependent: :destroy
  has_many :profile_wishlisted_books, dependent: :destroy
  has_many :profile_read_books, dependent: :destroy

  def favorite_book_ids
    profile_favorite_books.collect { |fav| fav.book.id }
  end

  def wishlist_book_ids
    profile_wishlisted_books.collect {|wishlist| wishlist.book.id}
  end
  def read_book_ids
    profile_read_books.collect {|read| read.book.id}
  end

end
