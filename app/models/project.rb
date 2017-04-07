class Project < ApplicationRecord
  has_many :todo
  belongs_to :user
  belongs_to :team
    validates :title, presence: true
end
