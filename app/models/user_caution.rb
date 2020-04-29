class UserCaution < ApplicationRecord
  belongs_to :user
  has_one :caution_freeze
end
