class Post < ApplicationRecord
  validates :title, :presence => true, :length => { :minimum => 5}, :uniqueness => true
  validates :content, :presence => true, :length => { :maximum => 5000}

  has_many :comments
  has_many :users
end


def highest_rating_comment
	comments.rating_desc.first
end
