# == Schema Information
#
# Table name: favorites
#
#  id               :bigint           not null, primary key
#  favoritable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  favoritable_id   :bigint
#  user_id          :bigint           not null
#
# Indexes
#
#  index_favorites_on_favoritable  (favoritable_type,favoritable_id)
#  index_favorites_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favoritable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:favoritable_type, :favoritable_id], message: "can only favorite something once" }
end
