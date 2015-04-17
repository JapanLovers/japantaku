class Comment < ActiveRecord::Base
	attr_accessor :date, :content

	validates :date, :presence => true 
	validates :content, :presence => true

	belongs_to :article

	has_many :comment
	belongs_to :comment
end
