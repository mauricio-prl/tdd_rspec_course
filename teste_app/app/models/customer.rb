class Customer < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true
	validates :address, presence: true


	has_many :orders
end
