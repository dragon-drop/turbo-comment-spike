class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment, counter_cache: true, touch: true

  validates :comment, uniqueness: { scope: :user }
end
