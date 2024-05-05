# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many(
    :posts,
    class_name: 'Post',
    foreign_key: 'user_id',
    inverse_of: :user,
    :dependent => :destroy,
  )
  # Work
  has_many :likes, :dependent => :destroy
  has_many :liked_posts, through: :likes, source: :likeable, source_type: 'Post', :dependent => :destroy

  has_many :favorites, :dependent => :destroy
  has_many :favorited_posts, through: :favorites, source: :favoritable, source_type: 'Post', dependent: :destroy

  has_many :comments, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  has_many :forks, :dependent => :destroy

  has_one :profile, :dependent => :destroy

  has_many :following_associations, class_name: "Follow", foreign_key: "follower_id", :dependent => :destroy
  has_many :follower_associations, class_name: "Follow", foreign_key: "followed_id", :dependent => :destroy

  has_many :following, through: :following_associations, source: :followed, :dependent => :destroy
  has_many :followers, through: :follower_associations, source: :follower, :dependent => :destroy

  after_create :create_user_profile

  has_one :business, :dependent => :destroy

  private


  def create_user_profile
    self.create_profile if self.profile.nil?
  end

end

