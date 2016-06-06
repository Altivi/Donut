class Post < ActiveRecord::Base
	belongs_to :author, class_name: "User"
	default_scope { order('created_at DESC') }
	
	validates :content, length: { minimum: 10, maximum: 140 }
end
