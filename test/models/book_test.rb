# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Refactor: search_by_title
  test 'search existing books by title' do
    result = Book.search_by_title('Lord')

    assert result.any?
    result.each do |book|
      assert book.title.include?('Lord')
    end
  end

  test 'search existing books by title case insensitive' do
    result = Book.search_by_title('lord')
    assert result.any?

    result.each do |book|
      assert book.title.include?('Lord')
    end
  end

  test 'search existing books support null title returns empty' do
    result = Book.search_by_title(nil)
    assert result.empty?
  end

  test 'search non existing books by title returns empty array' do
    result = Book.search_by_title('1984')
    assert result.empty?
  end
end
