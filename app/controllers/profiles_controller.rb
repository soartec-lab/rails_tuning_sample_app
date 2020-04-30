class ProfilesController < ApplicationController
   def index
    @user = User.find(1)
    raise Forbidden un less user_safe?

    @skill_categories = @user.skills.map(&:skill_category).uniq
    @articles = @user.articles
  end

  private

  def user_safe?
    @user.user_cautions.all? do |user_caution|
      Time.zone.now > user_caution.caution_freeze.end_time
    end
  end
end
