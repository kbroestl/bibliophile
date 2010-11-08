class Author < ActiveRecord::Base
  has_many :authorships
  has_many :books, :through => :authorships
  
  def fullname
    author_first + " " + author_last
  end
  
end
