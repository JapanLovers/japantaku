class User < ActiveRecord::Base
	attr_accessor :email, :pseudo, :desc, :avatar, :age, :nom, :prenom, :pwd

	validates :email, :presence => true, length => {:maximum => 60}, 
			   		  :format => { :with => email_regex },
			   		  :uniqueness => { :case_sensitive => false }
	validates :pseudo, :presence => true, length => {:maximum => 30}
					   :uniqueness => true
	validates :pwd, :presence => true, length => {:maximum => 100}

	has_many :article
end
