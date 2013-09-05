class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :rating, inclusion: 1..100

  has_many :checkout
  has_and_belongs_to_many :category
end
