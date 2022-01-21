class Comment < ApplicationRecord
  belongs_to :user
  has_many :likes

  after_create_commit { broadcast_append_to('comments', target: 'comments', locals: { comment: self }) }
  after_update_commit { broadcast_replace(target: "comment_#{id}", locals: { comment: self }) }
  after_touch { broadcast_replace(target: "comment_#{id}", locals: { comment: self }) }
end
