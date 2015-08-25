# == Schema Information
#
# Table name: monster_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  strength_id :integer
#  weakness_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class MonsterTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
