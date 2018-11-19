class UserSkillsController < ApplicationController
  before_action :set_user
  before_action :set_user_skill, only: [:show, :update, :destroy]

  def index
    @user_skills = @user.user_skills

    render json: @user_skills
  end

  def show
    render json: @user_skill
  end

  def create
    #Find or create the skill based on the name
    @skill = Skill.find_or_create_by(skill_name: user_skill_params[:skill_name])
    #Find or create the association based on the skill; upsert if found
    @user_skill = UserSkill.find_or_initialize_by(skill_id: @skill.id, user_id: @user.id)
    #Update attributes
    @user_skill.interest_level = user_skill_params[:interest_level]
    @user_skill.skill_level = user_skill_params[:skill_level]
    if @user_skill.save
      render json: @user_skill, status: :created, action: 'show'
    else
      render json: @user_skill.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_skill.update(user_skill_params)
      render json: @user_skill
    else
      render json: @user_skill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_skill.destroy
  end

private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_skill
    @user_skill = @user.user_skills.find(params[:id])
  end

  def user_skill_params
    params.permit(:user_id, :skill_name, :skill_level, :interest_level, :categories)
  end
end
