class Book < ActiveRecord::Base
  has_many :checkout
end
