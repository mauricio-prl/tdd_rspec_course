class Order < ApplicationRecord
	validates :description, :customer, presence: true

  belongs_to :customer
end
