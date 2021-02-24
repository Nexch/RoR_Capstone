class Tweet < ApplicationRecord
  acts_as_votable
  belongs_to :user
  validates :tweet, presence: true
  validates :tweet, format: { with: /\A[a-zA-Z]+\z/,
                              message: 'only allows letters' }
  validates :tweet, length: { maximum: 100 }
end
