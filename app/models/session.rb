class Session < Authlogic::Session::Base
  authenticate_with User
  generalize_credentials_error_messages "Sorry, that login information is not valid"  
end