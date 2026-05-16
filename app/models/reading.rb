# frozen_string_literal: true

# Basic ActiveRecord model Nothing fancy.
class Reading < ApplicationRecord
  belongs_to :book

  scope :overlapping, ->(start_date, end_date) {
    where(
      "date_started <= :end_date
        AND (
        date_finished IS NULL
        OR
        date_finished >= :start_date
        )",
        start_date: start_date,
        end_date: end_date
    )
  }
end
