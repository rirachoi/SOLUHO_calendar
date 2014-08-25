# == Schema Information
#
# Table name: lunar_to_solars
#
#  id         :integer          not null, primary key
#  lunar_date :string(255)
#  solar_date :string(255)
#  yun        :integer
#  created_at :datetime
#  updated_at :datetime
#
class LunarToSolar < ActiveRecord::Base
end


