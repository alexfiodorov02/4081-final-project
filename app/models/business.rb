# == Schema Information
#
# Table name: businesses
#
#  id              :bigint           not null, primary key
#  address         :string
#  bio             :text
#  menu            :text
#  name            :string
#  restaurant_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_businesses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Business < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :restaurant_type, presence: true
  validates :bio, length: { minimum: 10 }
end

