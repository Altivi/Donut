class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
				    storage: :dropbox,
				    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
				    dropbox_options: {  path: proc { |style| "avatars/#{id}/#{avatar.original_filename}" } }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_presence_of :first_name, :last_name, if: :active_or_identifying?
  validates :birth_date, presence: true, if: :active_or_identifying?
  validates :about_me, length: { maximum: 160, minimum: 6, allow_blank: true }, if: :active_or_personal?

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
