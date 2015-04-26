class AddClinicNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clinic_name, :string
  end
end
