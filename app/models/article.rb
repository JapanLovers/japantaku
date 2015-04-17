class Article < ActiveRecord::Base
	attr_accessor :title, :date, :content, :tags

	validates :title, :presence => true, length => {:maximum => 150},
					  :uniqueness => { :case_sensitive => false }
	validates :content, :presence => true
	validates :date, :presence => true
	validates :tags, :presence => true, length => {:maximum => 80}

	belongs_to :user

	has_many :comment
end
