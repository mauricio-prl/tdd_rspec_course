class AddGenderToCustomer < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :gender, :string 
  end
end
