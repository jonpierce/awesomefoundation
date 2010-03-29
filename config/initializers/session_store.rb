# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_af_session',
  :secret      => 'bd517269f1af2efa768af4bb9090a4ca732d6277bba6814a7cb02aabe9f6898f3e4eb85238fca50fb7fd67d4bd34db40047cbc5ee7ffb53f8c4453c1bbac035a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
