# frozen_string_literal: true

# Included in the book model is the logic around counting of books
# and stats related to publishers, languages, most-represented authors
class Book < ApplicationRecord
  attr_reader :author_tokens, :author_first, :author_last
  # relationships/associations
  has_many :authorships
  has_many :authors, through: :authorships
  has_many :readings
  belongs_to :language
  belongs_to :genre
  belongs_to :location
  accepts_nested_attributes_for :authors, :authorships
  # validations
  before_save :set_sortby_title

  # Why are all of these abstract methods, and is that overcomplicating this,
  # causeing more problems than it solves?

  def self.count_unread
    unreadjoins = <<-SQL
    left join readings r on r.book_id = books.id
    left join genres g on books.genre_id = g.id
    left join locations l on l.id = books.location_id
    SQL
    whereclause = <<-WC
    r.id is NULL and excluded = 0 and g.readable = 1 and l.readable = 1
    WC
    Book.joins(unreadjoins).where(whereclause).count
  end

  def self.find_in_process
    # rewriting this is out of scope just for 4.x upgrade
    # Not as Database agnostic as I'd like
    whereclause = <<-WC
    readings.date_started is not null
    and readings.date_finished is null
    WC
    Book.joins(:readings).where(whereclause)
  end

  def self.find_most_prominent_publishers
    # rewrite this method to use ORM DSL for better database abstraction
    query = <<-SQL
    select count(publisher) as "total", publisher
    from books
    where publisher <> ""
    group by publisher
    order by total desc
    limit 10;
    SQL
    Book.find_by_sql(query)
  end

  def self.unread_books
    # rewrite this method to use ORM DSL for better database abstraction
    query = <<-SQL
    select b.id, b.title
    from books b
    Left join readings r on r.book_id = b.id
    Left Join genres g on b.genre_id = g.id
    Left Join locations l on l.id = b.location_id
    where r.id is NULL and b.excluded = 0 and g.readable = 1
    and l.readable = 1 order by b.sortby_title
    SQL
    Book.find_by_sql(query)
  end

  def self.latest_readings
    # rewrite this method to use ORM DSL for better database abstraction
    query = <<-SQL
    select b.id, b.title, r.date_finished
    from books b
    INNER JOIN readings r on b.id = r.book_id
    where r.date_finished >= DATE_SUB(now(), interval 1 year)
    order by r.date_finished DESC
    SQL
    Book.find_by_sql(query)
  end

  def author_tokens=(ids)
    self.author_ids = ids.split(',')
  end

  def self.search(query)
    # double-check if this is sql-injection proof...
    # according to http://gavinmiller.io/2015/fixing-sql-injection-vulnerabilities/
    # this should be sql-injection safe:
    where('title like ?', "%#{query}%")
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

    articles = %w[the a an der die das dem den des ein eine eines einen einer]

    self.sortby_title = title.sub(/#{articles.join('\b|\A')}/i, '').lstrip
  end
end
