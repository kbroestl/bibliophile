class Reading < ActiveRecord::Base
  belongs_to :book
  
  #attr_protected :book_id
end
