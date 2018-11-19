class Skill < ApplicationRecord
  has_many :user_skills, :dependent => :destroy
  has_many :users, :through => :user_skills
  has_many :skill_categories, :dependent => :destroy
  has_many :categories, :through => :skill_categories

  def as_json(options={})
    super(only: [:id, :skill_name],
          include: { categories: { only: [:id, :category_name] } }
    )
  end
end
