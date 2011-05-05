class Genre < ActiveRecord::Base
  has_many :books
  
  def self.count_members( genre )
    Genre.count(:joins => "Inner Join books b on b.genre_id = genres.id", :conditions => "b.genre_id = #{genre}")
  end
  
end
