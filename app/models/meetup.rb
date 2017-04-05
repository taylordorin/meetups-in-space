class Meetup < ActiveRecord::Base
  has_many :members
  has_many :users,
  through: :members

  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
