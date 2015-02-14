class Feed < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  validates :name, presence: true

  def to_param
    "#{slug}"
  end
end
