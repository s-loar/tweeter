class Tweet < ApplicationRecord
  validates :message, presence: true

  default_scope { visible }
  scope :visible, -> { where(deleted_at: nil) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  scope :deleted, -> { with_deleted.where.not(deleted_at: nil) }

  after_create_commit { broadcast_prepend_to "tweets" }
  after_update_commit { broadcast_replace_to "tweets" }
  after_destroy_commit { broadcast_remove_to "tweets" }
end
