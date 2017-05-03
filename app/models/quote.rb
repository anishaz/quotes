class Quote < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :favorites

  validates :author, :quote, presence: true
end
