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

class Monster < ActiveRecord::Base
  
  #associations
  belongs_to :team
  belongs_to :user
  belongs_to :monster_type
  
  #validations
  validates :name, presence: true
  validate :user_monsters_cannot_be_past_twenty, :monsters_cannot_be_past_three_in_a_team
  
  accepts_nested_attributes_for :team
  
  def as_json(options={})
    { "name" => name,
      "type" => monster_type.name,
      "power" => power,
      "team" => team.name}
  end
  
  def self.sort(monsters, params)
    unless params[:sort] == "weakness"
      params[:sort] ||= "name"
      monsters.order("#{params[:sort]} ASC")
    else
      monsters.joins([:monster_type => :weakness]).order("monster_types.name ASC")
    end
  end
  
  private
    def user_monsters_cannot_be_past_twenty
      if user.monsters.count >= 20
        errors.add(:user_id, "can't be same for more than twenty monsters")
      end
    end
    
    def monsters_cannot_be_past_three_in_a_team
      if team.monsters.count >= 3
        errors.add(:team_id, "cam hold maximum of three monsters")
      end
    end
end
