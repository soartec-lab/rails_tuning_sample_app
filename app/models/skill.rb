class Skill < ApplicationRecord
  belongs_to :user
  has_many :skill_categories
  has_many :categories, through: :skill_categories
end
