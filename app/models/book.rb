class Book < ActiveRecord::Base
  has_many :authorships
  has_many :authors, :through => :authorships
  has_many :languages
end
