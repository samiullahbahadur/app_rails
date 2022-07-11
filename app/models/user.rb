class User < ActiveRecord::Base
  paginates_per 5 
  has_secure_password
    has_many :articles, dependent: :destroy
   #has_secure_password :transaction_password

 validates :username,  presence: true, uniqueness: true
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true , uniqueness: true, length:{maximum:105},
                 format:{with:VALID_EMAIL_REGEX} 
                         

end