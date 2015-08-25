# == Schema Information
#
# Table name: monsters
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  power           :string(255)
#  user_id         :integer
#  monster_type_id :integer
#  team_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
