# frozen_string_literal: true

class Book < ApplicationRecord
  def self.search_by_title(title)
    return [] if title_missing?(title)

    Book.where("title ILIKE '%#{title}%'")
  end

  def self.title_missing?(title)
    title.blank?
  end
end
