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

class MonsterType < ActiveRecord::Base
  
  #associations
  has_one :strength, class_name: "MonsterType", foreign_key: "strength_id"
  has_one :weakness, class_name: "MonsterType", foreign_key: "weakness_id"
  
  def self.seed
    fire = MonsterType.create(name: "fire")
    water = MonsterType.create(name: "water")
    earth = MonsterType.create(name: "earth")
    electric = MonsterType.create(name: "electric")
    wind = MonsterType.create(name: "wind")
    
    fire.update_attributes(strength_id: wind.id, weakness_id: water.id)
    water.update_attributes(strength_id: fire.id, weakness_id: earth.id)
    earth.update_attributes(strength_id: water.id, weakness_id: electric.id)
    electric.update_attributes(strength_id: earth.id, weakness_id: wind.id)
    wind.update_attributes(strength_id: electric.id, weakness_id: fire.id)
  end
end
