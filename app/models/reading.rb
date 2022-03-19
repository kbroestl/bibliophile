# frozen_string_literal: true

# Basic ActiveRecord model Nothing fancy.
class Reading < ApplicationRecord
  belongs_to :book

  def period
    date_started..date_finished
  end

end
