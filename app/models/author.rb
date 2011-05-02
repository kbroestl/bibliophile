class Author < ActiveRecord::Base
  # attr_reader :author_first, :author_last #This does not work anything like what I thought it did.
  has_many :authorships
  has_many :books, :through => :authorships
  before_save :process_author
  
  def fullname
    author_first + " " + author_last
  end
  
  # def as_json
  #   
  # end
  
  def process_author
    # Rails.logger.debug "Author last is #{author_last}"
    # Set the combined field "first_name last_name"
    
    #  self.name = author_last
    #  if author_first && author_first != ''
    #    self.name = author_first + " " + self.name
    #  end
    # Rails.logger.debug "Name is #{name}"
    
    self.name = "#{author_first} #{author_last}".strip
  end
     
  def json_attributes 
    { :id => id, :name => name }
  end
  
end
