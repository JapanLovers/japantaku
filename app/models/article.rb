class Article < ActiveRecord::Base
	attr_accessor :title, :date, :content, :tags

	validates :title, :presence => true
	validates :content, :presence => true
	validates :date, :presence => true
	validates :tags, :presence => true

	belongs_to :user

	has_many :comment
end
