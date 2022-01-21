class Comment < ApplicationRecord
  belongs_to :user
  has_many :likes

  after_create_commit do
    broadcast_append_to('comments', partial: 'comments/comment_frame', target: 'comments', locals: { comment: self })
  end
  after_update_commit do
    broadcast_replace(target: "comment_#{id}", partial: 'comments/comment_frame', locals: { comment: self })
  end
  after_touch do
    broadcast_replace(target: "comment_#{id}", partial: 'comments/comment_frame', locals: { comment: self })
  end
end
