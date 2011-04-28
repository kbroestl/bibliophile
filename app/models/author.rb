class Author < ActiveRecord::Base
  has_many :authorships
  has_many :books, :through => :authorships
  # before_save :determine_distinct_author
  
  def fullname
    author_first + " " + author_last
  end
  
  def json_attributes 
    { :id => id, :name => name }
  end
  
  def determine_distinct_author()
    authors.each do |author|
      Author.find_or_create_by_author_last( author.author_last )
    end
  end

end
