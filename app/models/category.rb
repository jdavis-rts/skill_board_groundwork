class Category < ApplicationRecord
  has_many :skill_categories, :dependent => :destroy
  has_many :skills, :through => :skill_categories

  def self.upsert_all(category_array, skill)
    category_array.each do |cat|
      new_cat = Category.find_or_create_by(category_name: cat)
      new_cat.skills << skill
    end
  end

  def as_json(options={})
    super(only: [:id, :category_name],
          include: { skills: { only: [:id, :skill_name] } })
  end
end
