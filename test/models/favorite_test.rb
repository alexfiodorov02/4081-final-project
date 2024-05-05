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
require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
