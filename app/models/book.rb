class Book < ActiveRecord::Base
  attr_accessible :author_first, :author_last, :author_tokens, :title, :publisher, :ISBN, :genre_id, :location_id, :pages, :language_id, :notes
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
    Book.count(:joins => "left join readings r on r.book_id = books.id", :conditions => "r.id is NULL")
  end
  
  def author_tokens=(ids)
    self.author_ids = ids.split(",")
  end
  
end
