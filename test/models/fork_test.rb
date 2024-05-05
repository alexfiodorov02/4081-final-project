# == Schema Information
#
# Table name: forks
#
#  id          :bigint           not null, primary key
#  body        :text
#  cuisine     :string
#  difficulty  :string
#  flags_count :integer          default(0)
#  meal        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_forks_on_post_id  (post_id)
#  index_forks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ForkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
