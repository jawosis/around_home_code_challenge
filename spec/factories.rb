FactoryBot.define do
  factory :customer do
    phone { '+49157122113344' }
  end

  factory :partner do
    sequence(:name) { |i| "Partner #{i}" }
    email { 'info@contact.de' }
    phone { '+4991133445566' }
    operating_radius_in_km { 50 }
    street { 'Bahnhofstraße 5' }
    city { 'Nürnberg' }
    country { 'Deutschland' }
    avg_rating { 3.66 }
  end

  factory :category do
    name { 'flooring' }
  end

  factory :material do
    name { 'wood' }
  end

  factory :product do
    category
    material
  end

  factory :project do
    customer
    product
    size_in_qm { 12.5 }
    street { 'Hauptstraße 5' }
    city { 'Erlangen' }
    state { 'Bayern' }
    country { 'Deutschland' }
  end
end
