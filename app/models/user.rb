class User < ActiveRecord::Base
  has_secure_password
  has_many :quotes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true, length: { in: 2..40 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :date_of_birth, presence: true #still keep this in to check for presence
  validate :date_of_birth_cannot_be_in_the_future #custom validations dont have a plural validates

  def date_of_birth_cannot_be_in_the_future
    if date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end

  before_save :lowercase

  def lowercase
    email.downcase!
  end

end
