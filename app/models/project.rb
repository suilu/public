class Project < ApplicationRecord
  has_many :todo
  belongs_to :user
  belongs_to :team
  has_many :comments, dependent: :destroy
    validates :title, presence: true
end
