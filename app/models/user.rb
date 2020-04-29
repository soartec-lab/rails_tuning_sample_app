class User < ApplicationRecord
  has_many :user_cautions
  has_many :articles
  has_many :skills
end
