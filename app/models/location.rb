# frozen_string_literal: true

# Basic Active Record class.
# No business logic here as yet.
class Location < ActiveRecord::Base
  has_many :books
end
