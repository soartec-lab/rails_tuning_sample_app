class SkillCategory < ApplicationRecord
  belongs_to :skill
  belongs_to :category
end
