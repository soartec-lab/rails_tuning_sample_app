class User < ApplicationRecord
  has_one :block_user
  has_many :articles
  has_many :skills
end
