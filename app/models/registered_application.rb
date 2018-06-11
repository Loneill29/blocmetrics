class RegisteredApplication < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :url, uniqueness: true
  validates :url, :format => URI::regexp(%w(http https))
end
