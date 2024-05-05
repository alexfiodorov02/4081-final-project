# == Schema Information
#
# Table name: flags
#
#  id             :bigint           not null, primary key
#  flaggable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  flaggable_id   :bigint
#  user_id        :bigint           not null
#
# Indexes
#
#  index_flags_on_flaggable  (flaggable_type,flaggable_id)
#  index_flags_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Flag < ApplicationRecord
  belongs_to :user
  belongs_to :flaggable, polymorphic: true, counter_cache: true
  validates :flaggable_type, :flaggable_id, presence: true
end
