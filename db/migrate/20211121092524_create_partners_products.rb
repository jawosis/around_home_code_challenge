class CreatePartnersProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :partners_products do |t|
      t.belongs_to :partner
      t.belongs_to :product

      t.timestamps
    end
  end
end
