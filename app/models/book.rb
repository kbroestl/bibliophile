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
    Book.count(:joins => "left join readings r on r.book_id = books.id", :conditions => "r.id is NULL and excluded = 0")
  end
  
  def self.find_most_prominent_publishers
    Book.find_by_sql('select count(publisher) as "total", publisher from books where publisher <> "" group by publisher order by total desc limit 10;')
  end
  
  def self.unread_books()
    Book.find_by_sql("Select b.id, b.title from books b Left join readings r on r.book_id = b.id where r.id is NULL and b.excluded = 0")
  end
  
  def author_tokens=(ids)
    self.author_ids = ids.split(",")
  end
  
end
