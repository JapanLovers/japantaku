class User < ActiveRecord::Base
	attr_accessor :email, :pseudo, :desc, :avatar, :age, :nom, :prenom, :pwd

	validates :email, :presence => true
	validates :pseudo, :presence => true
	validates :pwd, :presence => true

	has_many :article
end
