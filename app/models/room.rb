class Room < ActiveRecord::Base
  acts_as_followable

  default_scope { order("created_at DESC") }

  has_many :messages
  belongs_to :creator, class_name: "User"
  

  validates_presence_of :creator_id
  validates :title, uniqueness: true, length: { maximum: 25 }, presence: true
  
  def creator?(user)
    creator == user
  end
end
