class User < ApplicationRecord
  
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :e_mail, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 3 } 

def authenticate

end
