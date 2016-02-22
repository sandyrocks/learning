class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :country
      t.string :email
      t.datetime :dob
      t.string :mobile_number
      t.string :landline_number
      t.integer :age

      t.timestamps null: false
    end
  end
end
