class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :skill_category, optional: true
end
