class Team < ApplicationRecord
  belongs_to :user
  has_many :projects
  validates :title, presence: true
end
