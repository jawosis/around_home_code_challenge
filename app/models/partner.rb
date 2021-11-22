class Partner < ApplicationRecord
  include Addressable
  
  has_and_belongs_to_many :products
  has_many :ratings
  has_many :projects

  scope :for_product, -> (product_id) { includes(:products).where(products: { id: product_id }) }
  scope :experienced_with_category, -> (category_id) { includes(:projects).where(projects: { category_id: category_id }) }
end
