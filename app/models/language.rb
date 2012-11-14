class Language < ActiveRecord::Base
  has_many :books

  def self.lchartstats()
    Language.find_by_sql("select x.total, x.Language, 100 * x.total / b.total as percent from (select count(books.id) as total, ol.Language from books INNER join languages ol on ol.id = books.original_language group by ol.Language) x Inner join ( select count(*) as total from books where original_language is not NULL ) b order by x.total desc, x.Language;")
  end
end
