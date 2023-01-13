class User < ApplicationRecord
  
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :e_mail, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 3 } 

def authenticate_with_credentials(email, password) 
  email = email.downcase.strip
  user = User.find_by_email(email)
  
  if user && user.authenticate(password)
    user
  else
    nil
  end

end

end
