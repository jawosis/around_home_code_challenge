class Product < ApplicationRecord
  belongs_to :category
  belongs_to :material
  has_and_belongs_to_many :partners
  has_many :projects
end
