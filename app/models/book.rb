class Book < ActiveRecord::Base
  attr_accessible :author_first, :author_last, :author_tokens, :title, :publisher, :ISBN, :genre_id, :location_id, :pages, :language_id, :notes, :excluded
  attr_reader :author_tokens, :author_first, :author_last
  #relationships/associations
  has_many :authorships
  has_many :authors, :through => :authorships
  has_many :readings
  belongs_to :language
  belongs_to :genre
  belongs_to :location
  accepts_nested_attributes_for :authors, :authorships
  #validations
  
  def self.count_unread()
    Book.count(:joins => "left join readings r on r.book_id = books.id left join genres g on books.genre_id = g.id left join locations l on l.id = books.location_id", :conditions => "r.id is NULL and excluded = 0 and g.readable = 1 and l.readable = 1")
  end
  
  def self.find_most_prominent_publishers
    Book.find_by_sql('select count(publisher) as "total", publisher from books where publisher <> "" group by publisher order by total desc limit 10;')
  end
  
  def self.unread_books()
    Book.find_by_sql("Select b.id, b.title from books b Left join readings r on r.book_id = b.id Left Join genres g on b.genre_id = g.id Left Join locations l on l.id = b.location_id where r.id is NULL and b.excluded = 0 and g.readable = 1 and l.readable = 1")
  end
  
  def self.latest_readings()
    Book.find_by_sql('select b.id, b.title, r.date_finished from books b INNER JOIN readings r on b.id = r.book_id order by r.date_finished DESC limit 10')
  end
    
  def author_tokens=(ids)
    self.author_ids = ids.split(",")
  end
  
end
