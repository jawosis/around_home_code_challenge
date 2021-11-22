class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.belongs_to :material

      t.timestamps
    end
  end
end
