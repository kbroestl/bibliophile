# frozen_string_literal: true

# Basic ActiveRecord model Nothing fancy.
class Reading < ActiveRecord::Base
  belongs_to :book
end
