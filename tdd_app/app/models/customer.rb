class Customer < ApplicationRecord
  validates :name, :email, :smolker, :avatar, presence: true
end
