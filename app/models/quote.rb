class Quote < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :favorites

  validates :author, presence: true, length: {minimum: 4}
  validates :quote, presence: true, length: {minimum: 11}
end
