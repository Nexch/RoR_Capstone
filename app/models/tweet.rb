class Tweet < ApplicationRecord
  acts_as_votable
  belongs_to :user
end
