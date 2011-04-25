class Book < ActiveRecord::Base
  #relationships/associations
  has_many :authorships
  has_many :authors, :through => :authorships
  has_many :readings
  belongs_to :language
  belongs_to :genre
  belongs_to :location
  accepts_nested_attributes_for :authors, :authorships
  #validations
  
  # before_create :determine_distinct_author
  
  # still working on this one. Should be a simple function call, but something's
  # amiss.
  def count_unread()
    Book.count(:joins => "left join readings r on r.book_id = books.id", :conditions => "r.id is NULL")
  end
  
  # def determine_distinct_author
  #   authors.each do |author|
  #     Author.find_or_create_by_author_last( author.author_last )
  #   end
  # end
end
