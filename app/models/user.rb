require 'digest'

class User < ActiveRecord::Base

  before_save :encrypt_password

  def has_password?(pass)
    pwd == encrypt(pass)
  end

  def self.authenticate(pseudo_or_email, pass)
    user = User.find_by_email(pseudo_or_email)
    user = User.find_by_pseudo(pseudo_or_email) if user.nil?
    return nil if user.nil?
    return user if user.has_password?(pass) 
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private
	def encrypt_password
	  self.salt = make_salt if new_record?
	  self.pwd = encrypt(pwd) if new_record?
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
