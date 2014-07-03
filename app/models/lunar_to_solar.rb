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

#LunarToSolar.find_by(:lunar_date => '19970101').solar_date
#   LunarToSolar Load (0.9ms)  SELECT  "lunar_to_solars".* FROM "lunar_to_solars"  WHERE "lunar_to_solars"."lunar_date" = '19970101' LIMIT 1
# => "19970208"
# Date.parse(LunarToSolar.find_by(:lunar_date => '19970101').solar_date)
#   LunarToSolar Load (0.7ms)  SELECT  "lunar_to_solars".* FROM "lunar_to_solars"  WHERE "lunar_to_solars"."lunar_date" = '19970101' LIMIT 1
# => Sat, 08 Feb 1997
#  Date.parse(LunarToSolar.find_by(:lunar_date => '19970229').solar_date)
#   LunarToSolar Load (0.8ms)  SELECT  "lunar_to_solars".* FROM "lunar_to_solars"  WHERE "lunar_to_solars"."lunar_date" = '19970229' LIMIT 1
# => Sun, 06 Apr 1997

