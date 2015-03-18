class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password
  validates :name, :email, :presence => true
  has_and_belongs_to_many :photos

def encrypt_password
  self.password_salt = BCrypt::Engine.generate_salt
  self.password_hash = BCrypt::Engine.hash_secret(self.password, password_salt)
end

def self.authenticate(email, password)

end

end