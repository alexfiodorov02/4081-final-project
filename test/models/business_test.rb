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
require "test_helper"

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

