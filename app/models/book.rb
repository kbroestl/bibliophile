class Book < ActiveRecord::Base
  # attr_accessible :author_first, :author_last, :author_tokens, :title, :publisher, :ISBN, :genre_id, :location_id, :pages, :language_id, :notes, :excluded, :original_language
  attr_reader :author_tokens, :author_first, :author_last
  # relationships/associations
  has_many :authorships
  has_many :authors, :through => :authorships
  has_many :readings
  belongs_to :language
  belongs_to :genre
  belongs_to :location
  # belongs_to :original_language, :class_name => 'Language', :foreign_key => 'original_language'
  accepts_nested_attributes_for :authors, :authorships
  # validations
  before_save :set_sortby_title

  # Why are all of these abstract methods, and is that overcomplicating this, 
  # causeing more problems than it solves?

  def self.count_unread()
    # rewriting this is out of scope just for 4.x upgrade
    Book.joins("left join readings r on r.book_id = books.id left join genres g on books.genre_id = g.id left join locations l on l.id = books.location_id").where("r.id is NULL and excluded = 0 and g.readable = 1 and l.readable = 1").count
  end

  def self.find_in_process()
    # rewriting this is out of scope just for 4.x upgrade
    # Not as Database agnostic as I'd like
    Book.joins(:readings).where("readings.date_started is not null and readings.date_finished is null")
  end

  def self.find_most_prominent_publishers
    # rewrite this method to use ORM DSL for better database abstraction
    Book.find_by_sql('select count(publisher) as "total", publisher from books where publisher <> "" group by publisher order by total desc limit 10;')
  end

  def self.unread_books()
    # rewrite this method to use ORM DSL for better database abstraction
    Book.find_by_sql("Select b.id, b.title from books b Left join readings r on r.book_id = b.id Left Join genres g on b.genre_id = g.id Left Join locations l on l.id = b.location_id where r.id is NULL and b.excluded = 0 and g.readable = 1 and l.readable = 1 order by b.sortby_title")
  end

  def self.latest_readings()
    # rewrite this method to use ORM DSL for better database abstraction
    Book.find_by_sql('select b.id, b.title, r.date_finished from books b INNER JOIN readings r on b.id = r.book_id where r.date_finished >= DATE_SUB(now(), interval 1 year) order by r.date_finished DESC')
  end

  def author_tokens=(ids)
    self.author_ids = ids.split(",")
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def set_sortby_title
      # as we discover more articles (for instance french, spanish, etc.), add 
      # to the array of articles. Ideally, "The Rise and Fall of the Third 
      # Reich" returns "Rise and Fall of the Third Reich", "Die Elixiere des 
      # Teufels" should return "Elixiere des Teufels"
      # Question: so the first element in the replacement array will replace 
      # multiple throughout the title. WHY?
      # Following replaces all instances of the first (and only the first 
      # member) of the articles array:
      # self.sortby_title = title.gsub(/#{articles.join('\b|\A')}/i,'').lstrip()

      articles = %W(the a an der die das dem den des ein eine eines einen einer)

      self.sortby_title = title.sub(/#{articles.join('\b|\A')}/i, '').lstrip()
  end
  
end
