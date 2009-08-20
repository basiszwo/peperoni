# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_peperoni_session',
  :secret      => '504d5cca2ae1fa571af35063760086e2eeac0dd9b506f02ced5beaafb2667dd00768a443523ed3affaee5475100fc3e4459458d9b4c1cf2b2376e8a490a48766'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
