class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :operating_radius_in_km
      t.decimal :avg_rating, precision: 3, scale: 2, default: 0.00
      t.float :latitude
      t.float :longitude
      t.string :street
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
