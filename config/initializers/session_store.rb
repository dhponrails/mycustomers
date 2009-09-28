# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mycustomers_session',
  :secret      => '6b91fa828d0d544e3e9fe9aaaa29797b9efdb2184339f69cf5e748a0683c43551e65929879ba58ab56265abe013e48652f97dfdf83a5d966809651253319ce09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
