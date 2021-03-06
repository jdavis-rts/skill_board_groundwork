class User < ApplicationRecord
  has_many :user_skills, :dependent => :destroy
  has_many :skills, :through => :user_skills

  def as_json(options={})
    super(only: [:id, :username, :first_name, :last_name, :email_address, :job_title],
          include: [ skills: {
                      only: [:id, :skill_name],
                      include: [ categories: {
                          only: [:id, :category_name]
                        }]
                    } ])
  end
end
