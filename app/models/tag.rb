# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  category   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings, source: :taggable, source_type: 'Post'
  has_many :forks, through: :taggings, source: :taggable, source_type: 'Fork'

  validates :name, presence: true, uniqueness: { scope: :category }
  validates :category, inclusion: { in: ['difficulty', 'meal', 'cuisine', 'dietary'] }
end
