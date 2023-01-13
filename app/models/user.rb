class User < ApplicationRecord
  
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :e_mail, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 3 } 

  # not sure if abstracting this to the User model was needed, however, it does keep most logic regarding checking the user validity inside this class, however checking login validity should maybe remain in the session controller?
  # There is no session model created, is that why we moved the logic here? there must be a way to test a controller?

def self.authenticate_with_credentials(email, password) 
  @user = User.find_by_e_mail(email)
  if @user && @user.authenticate(password)
    @user
  else
    nil
  end

end

end
