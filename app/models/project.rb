class Project < ApplicationRecord

  belongs_to :user
  belongs_to :team
    validates :title, presence: true
end
