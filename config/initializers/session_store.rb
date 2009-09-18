# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_democms_session',
  :secret      => '6500790eac3aa2e1ce113c6702edc837076ae38b3d1ec8c7c0a407dccdc7f40e8944185b3b7e1ceefb709a0438c8ad796f0b4c65e9d1d3a5c0447b1d42a5306d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
