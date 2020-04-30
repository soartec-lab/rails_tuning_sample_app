class ProfilesController < ApplicationController
   def index
    @user = User.find(1)
    raise Forbidden unless user_safe?

    @skill_categories = user_reccomend_skill_categories
    @articles = @user.articles
  end

  private

  def user_safe?
    @user.user_cautions.joins(:caution_freeze).
      where("caution_freezes.end_time > ?", Time.zone.now).blank?
  end

  def user_reccomend_skill_categories
    @user.skills.eager_load(:skill_category).
      where(skill_categories: { reccomend: true }).
      map(&:skill_category).
      uniq
  end
end
