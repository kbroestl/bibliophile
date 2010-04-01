# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_RailsPortal_session',
  :secret      => 'fbe209bebb044a44ef97261a7f6fc45a3967712740ae4c817a6af0be546a829afc491bbb71aee20a0a093212bd40c3a4cb9b23f631d85ef9e8826d51e5ac5599'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
