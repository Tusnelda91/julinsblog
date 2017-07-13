class Post < ApplicationRecord
  #always title and content
  validates :title, :content, :presence => true
  #length of title at least 5 letters
  validates :title, :length => { :minimum => 5}
  #length of content not more than
  validates :content, :length => { :maximum => 200}
  # title should not repeat
  validates :title, :uniqueness => true
end
