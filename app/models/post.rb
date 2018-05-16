class Post < ActiveRecord::Base
  extend FriendlyId
  validates :body, :title, presence: true

  friendly_id :title, use: :slugged
end
