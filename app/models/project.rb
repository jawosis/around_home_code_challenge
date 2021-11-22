class Project < ApplicationRecord
  include Addressable

  belongs_to :customer
  belongs_to :partner, optional: true
  belongs_to :product
  belongs_to :category

  before_validation :set_category

  def recommended_partners
    max_distance = Partner.where(country: country).maximum('operating_radius_in_km')
    Partner.for_product(product_id)
      .experienced_with_category(category_id)
      .order(avg_rating: :desc)
      .near([latitude, longitude], max_distance)
      .to_a.delete_if { |p| p.distance_from([latitude, longitude]) > p.operating_radius_in_km }
  end

  private

  def set_category
    self.category = product.category
  end
end
