class ProfilesController < ApplicationController
  def index
    @user = User.find(1)
    # @skill_categories = @user.skills.map(&:skill_category).uniq.compact
    # 4869ms
    # @skill_categories = @user.skills.eager_load(:skill_category).map(&:skill_category).uniq.compact
    # 6331ms
    # @skill_categories = @user.skills.joins(:skill_category).map(&:skill_category).uniq.compact
    # @skill_categories = []
    @skill_categories = @user.skills.preload(:skill_category).map(&:skill_category).uniq.compact
    # 4297ms

    # @articles = @user.articles
    # 4297ms
    # @articles = @user.articles.preload(:tags)
    # 4369ms
    @articles = @user.articles.eager_load(:tags)
    # 4241ms
  end
end

# @user = User.find(1)
# Benchmark.realtime do
#   # @skill_categories = @user.skills.eager_load(:skill_category).map(&:skill_category).uniq.compact
#   @skill_categories = @user.skills.preload(:skill_category).map(&:skill_category).uniq.compact
#   @skill_categories = @user.skills.joins(:skill_category).map(&:skill_category).uniq.compact
# end

# @skill_categories.each do |category|
#   category.name
#   @user.skills.where(skill_category: category).each do |skill|
#     skill.name
#   end
# end