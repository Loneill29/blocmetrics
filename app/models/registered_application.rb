class RegisteredApplication < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :url, uniqueness: true
  validates :url, :format => URI::regexp(%w(http https))
end
