# frozen_string_literal: true

# Class to also include methods for sanitizing author names
# and collect stats for relating to authors
class Author < ApplicationRecord
  has_many :authorships
  has_many :books, through: :authorships
  has_one :biography
  before_save :process_author

  def fullname
    author_first + ' ' + author_last
  end

  def process_author
    self.name = "#{author_first} #{author_last}".strip
  end

  def self.find_most_prominent_authors
    query = <<-SQL
    select count(ap.author_id) as "total", a.name, a.id
    from authorships ap
    Inner Join authors a on ap.author_id = a.id
    group by ap.author_id
    order by total DESC limit 10
    SQL
    Author.find_by_sql(query)
  end

  def json_attributes
    { id: id, name: name }
  end
end
