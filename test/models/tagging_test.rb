# == Schema Information
#
# Table name: taggings
#
#  id            :bigint           not null, primary key
#  taggable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tag_id        :bigint           not null
#  taggable_id   :bigint           not null
#
# Indexes
#
#  index_taggings_on_tag_id    (tag_id)
#  index_taggings_on_taggable  (taggable_type,taggable_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#
require "test_helper"

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
