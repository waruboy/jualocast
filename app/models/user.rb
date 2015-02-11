class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[a-z0-9]+\z/i

  before_save :downcase!

  validates :username, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: VALID_USERNAME_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  def to_param
    "#{username}"
  end

  private

  def downcase!
    self.username = username.downcase
    self.email = email.downcase
  end
end
