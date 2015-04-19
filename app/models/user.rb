require 'digest'

class User < ActiveRecord::Base

  before_save :encrypt_password

  def has_password?(pass)
    pwd == encrypt(pass)
  end

  def self.authenticate(pseudo, pass)
    user = User.find_by_pseudo(pseudo)
    print user
    return nil if user.nil?
    return user if user.has_password?(pass) 
  end

  private
	def encrypt_password
	  self.salt = make_salt if new_record?
	  self.pwd = encrypt(pwd)
	end

	def encrypt(string)
	  secure_hash("#{salt}--#{string}")
	end

	def make_salt
	  secure_hash("#{Time.now.utc}--#{pwd}")
	end

	def secure_hash(string)
	  Digest::SHA2.hexdigest(string)
	end
end
