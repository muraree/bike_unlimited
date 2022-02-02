class CreateRiders < ActiveRecord::Migration[6.1]
  def change
    create_table :riders do |t|
      t.string :bike_name, null: false
      t.string :email, null: false
      t.string :year
      t.string :owner_type
      t.string :licence_number, null: false
      t.string :user_name, null: false
      t.string :bike_number, null: false
      t.date   :dob, null: false 
      t.timestamps
    end
  end
end
