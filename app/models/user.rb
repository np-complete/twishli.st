class User < ActiveRecord::Base
  WISHLIST_REGEX = %r{\Ahttps?://www\.amazon\..+/registry/wishlist/[A-Z0-9]+\Z}
  devise :omniauthable

  validates :screen_name, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :url, format: { with: WISHLIST_REGEX, allow_nil: true }

  def self.from_omniauth(auth)
    find_or_create_by(uid: auth.uid) do |user|
      user.screen_name = auth.info.nickname
    end
  end
end
