require 'wikipedia'

class Biography < ApplicationRecord
	belongs_to :author

	def self.fetch_bio (author)
	  bio = Wikipedia.find( author.fullname )	
	end
	# rudimentary version works. Fetches by author name.
	# Need to save bio.summary, bio.image_url to database
	# Additionally, check database for last fetch, as to not spam the wikipedia
	# servers.
	#
	# From author view, fetch info into sidebar, may need ajax later.
end
