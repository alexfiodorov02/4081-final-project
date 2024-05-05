# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  cuisine     :string
#  description :text
#  difficulty  :string
#  directions  :text
#  flags_count :integer
#  ingredients :text
#  meal        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
    include Taggable

    belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts

    validates :title, presence: true
    validates :description, :ingredients, :directions, presence: true

    has_one_attached :image

    has_many :likes, as: :likeable, :dependent => :destroy
    has_many :likers, through: :likes, source: :user, :dependent => :destroy

    has_many :taggings, as: :taggable, :dependent => :destroy
    has_many :tags, through: :taggings

    has_many :favorites, as: :favoritable, :dependent => :destroy
    has_many :favoriters, through: :favorites, source: :user, :dependent => :destroy

    has_many :comments, as: :commentable, :dependent => :destroy
    has_many :flags, as: :flaggable, :dependent => :destroy
    has_many :forks

    validate :image_type, :image_size

    def self.search(term)
      if term
        where('title ILIKE :term OR body ILIKE :term', term: "%#{term}%")
      else
        all
      end
    end

    def self.sorted(sort_by)
      case sort_by
      when 'date'
        order(created_at: :desc)
      when 'likes'
        joins(:likes).group('posts.id').order('COUNT(likes.id) DESC')
      else
        order(created_at: :desc)
      end
    end

    def liked_by?(user)
        likes.exists?(user: user)
    end

    def favorite_for(user)
        favorites.find_by(user: user)
    end

    def flagged?(user)
        flags.exists?(user: user)
    end

    def forked?
        forks.any?
    end

    def forked_by?(user)
        forks.exists?(user: user)
    end

    def tags_for(category)
        tags.where(category: category).pluck(:name).join(', ')
    end

    private

    def image_type
        if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
            errors.add(:image, "must be a JPEG or PNG")
        end
    end

    def image_size
        if image.attached? && image.byte_size > 5.megabytes
            errors.add(:image, "size must be less than 5MB")
        end
    end
end
