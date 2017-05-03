class Quote < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  validates :quote, presence: true
end
