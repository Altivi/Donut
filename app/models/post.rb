class Post < ActiveRecord::Base
	acts_as_likeable
  belongs_to :author, class_name: "User"
	
	validates :content, length: { minimum: 10, maximum: 1000 }
end
