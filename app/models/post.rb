class Post < ApplicationRecord
  validates :title, :presence => true, :length => { :minimum => 5}, :uniqueness => true
  validates :content, :presence => true, :length => { :maximum => 200}

  has_many :comments
  has_many :users
end



