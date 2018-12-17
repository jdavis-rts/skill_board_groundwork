class SearchController < ApplicationController

  def index
    case search_params[:type]
    when "user"
      @users = User.where("username LIKE '%#{search_params[:term]}%' OR email_address LIKE '%#{search_params[:term]}%'")
      render json: @users
    when "skill"
      @skills = Skill.where("skill_name LIKE '%#{search_params[:term]}%'")
      render json: @skills
    when "category"
      @categories = Category.where("category_name LIKE '%#{search_params[:terms]}%'")
      render json: @categories
    else
      render json: { "message": "Unknown search type" }, status: :unprocessable_entity
    end
  end

private

  def search_params
    params.permit(:type, :term)
  end

end
