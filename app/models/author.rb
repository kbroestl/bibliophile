class Author < ActiveRecord::Base
  has_many :authorships
  has_many :books, :through => :authorships
  
  def fullname
    return author_first + " " + author_last
  end
  
  def is_translator
    #TODO leverage the association with the book to figure out if someone is the translator
  end
end
