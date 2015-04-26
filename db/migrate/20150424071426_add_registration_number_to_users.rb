class AddRegistrationNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :registration_number, :integer
  end
end
