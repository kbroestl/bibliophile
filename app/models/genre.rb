# frozen_string_literal: true

# Include methods to gather stats around genres.
class Genre < ApplicationRecord
  has_many :books

  def count_members
  	self.books.count
  end
end
