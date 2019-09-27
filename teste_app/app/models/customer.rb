class Customer < ApplicationRecord
	validates :name, :email, :address, :gender, presence: true

	has_many :orders, dependent: :destroy
end
