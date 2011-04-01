class Book < ActiveRecord::Base
  #relationships/associations
  has_many :authorships
  has_many :authors, :through => :authorships
  has_many :readings
  belongs_to :language
  belongs_to :genre
  belongs_to :location
  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :authorships
  
  #validations
  
end
