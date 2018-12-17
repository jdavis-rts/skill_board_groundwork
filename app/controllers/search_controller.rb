class SearchController < ApplicationController

  def index
    @users = User.where("username LIKE '%#{search_params[:term]}%' OR email_address LIKE '%#{search_params[:term]}%'")
    @skills = Skill.where("skill_name LIKE '%#{search_params[:term]}%'")
    @categories = Category.where("category_name LIKE '%#{search_params[:term]}%'")
    render json: { user_results: @users, skill_results: @skills, category_results: @categories }
  end

private

  def search_params
    params.permit(:type, :term)
  end

end
