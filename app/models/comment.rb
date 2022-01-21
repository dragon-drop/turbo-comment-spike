class Comment < ApplicationRecord
  belongs_to :user
  has_many :likes

  after_create_commit { broadcast_append_to('comments', target: 'comments', locals: { comment: self }) }
end
