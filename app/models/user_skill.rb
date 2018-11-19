class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :categories, :through => :skill

  def as_json(options={})
    super(only: [:id, :skill_level, :interest_level],
          include: [ skill: {
                      only: [:id, :skill_name],
                      include: [ categories: {
                          only: [:id, :category_name]
                        }] 
                    } ])
  end
end
