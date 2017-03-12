class User < ActiveRecord::Base
  acts_as_follower
  acts_as_liker
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :posts, foreign_key: :author_id, dependent: :delete_all
  has_many :rooms, foreign_key: :creator_id
  has_many :messages, foreign_key: :author_id
  has_many :deleted_messages
  has_attached_file :avatar, styles: { medium: "250x250#", thumb: "100x100#" }#,
				    # storage: :dropbox,
				    # dropbox_credentials: Rails.root.join("config/dropbox.yml"),
				    # dropbox_options: {  path: proc { |style| "avatars/#{id}/#{avatar.original_filename}" } }
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_presence_of :first_name, :last_name, if: :active_or_identifying?
  validates :birth_date, presence: true, if: :active_or_identifying?
  validates :about_me, length: { maximum: 160, minimum: 6, allow_blank: true }, if: :active_or_personal?
  
  after_save :save_avatar_url

  def save_avatar_url
    if avatar.url != dropbox_avatar_url && avatar.exists?
      self.update_column(:dropbox_avatar_url, avatar.url)
      self.update_column(:medium_avatar_url, avatar.url(:medium))
      self.update_column(:thumb_avatar_url, avatar.url(:thumb))
    end
  end

  def active?
    signup_status == 'active'
  end

  def active_or_identifying?
    (signup_status == 'identifying' || active?) && !sign_in_count.zero?
  end

  def active_or_personal?
    (signup_status == 'personal' || active?) && !sign_in_count.zero?
  end
end
