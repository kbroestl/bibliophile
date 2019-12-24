# frozen_string_literal: true

# Basic Active Record class.
# No business logic here as yet.
class Location < ApplicationRecord
  has_many :books
end
