class Skill < ApplicationRecord
  has_many :user_skills
  has_many :users, :through => :user_skills
  has_many :skill_categories
  has_many :categories, :through => :skill_categories
end
