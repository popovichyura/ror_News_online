class Article < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :article_comments
end
