# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :books

  def self.count_by_location
    query = <<-SQL
    select count(b.location_id) as "total", l.name, l.id
    from locations l
    Inner Join books b on b.location_id = l.id
    group by l.id
    SQL
    Location.find_by_sql(query)
  end
end
