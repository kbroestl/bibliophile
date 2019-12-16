# frozen_string_literal: true

# Basic ActiveRecord Model, with some stat generation bits for the
# Pie chart on the home page.
class Language < ApplicationRecord
  has_many :books

  def self.lchartstats
    query = <<-SQL
    select x.total, x.name, 100 * x.total / b.total as percent
    from (select count(books.id) as total, ol.name
    from books INNER join languages ol on ol.id = books.original_language
    group by ol.name) x
    Inner join ( select count(*) as total
    from books where original_language is not NULL ) b
    order by x.total desc, x.name;
    SQL
    Language.find_by_sql(query)
  end
end
