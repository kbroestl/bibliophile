class Authorship < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
  
  #
  # thoughts from Brian:
  # Remove the nested_attributes from the Book for :authors, only :authorships
  # add accessor methods (attr accessors) for first and last name
  # add the before save to this model for verification of disticnt author
  # DELEGATE author_first_name to book
  # looking for first and last name on the authorships model, which won't work (not actual fields)
  #
  
end