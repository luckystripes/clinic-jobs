class RemoveUsersClinicName < ActiveRecord::Migration
  def change
  	remove_columns :users, :ClinicName
  	remove_columns :users, :RegistrationNumber
  end
end
