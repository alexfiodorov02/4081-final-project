# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  r_address  :string
#  r_city     :string
#  r_name     :string
#  r_state    :string
#  r_type     :string
#  r_zip      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
