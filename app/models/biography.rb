# frozen_string_literal: true

require 'wikipedia'

class Biography < ApplicationRecord
  belongs_to :author

  def self.fetch_bio (author)
    bio = Wikipedia.find( author.fullname )

    # self.image_url = bio.main_image_url
    # self.bio_text = bio.summary
    # self.author_id = author.id
  end
  # rudimentary version works. Fetches by author name.
  # Need to save bio.summary, bio.image_url to database
  # Additionally, check database for last fetch, as to not spam the wikipedia
  # servers.
  #
  # From author view, fetch info into sidebar, may need ajax later.

  # Wikipedia API does not allow for pulling content via URL, only search by
  # title, which might match 100%. Need to have a way to circumvent that 
  # system: Maybe allow to override the title (@author.full_name, by default)
  # with a user-confirmed value.
end
