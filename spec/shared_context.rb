RSpec.shared_context "partners" do
  let(:flooring) { FactoryBot.create(:category) }
  let(:roofing) { FactoryBot.create(:category, name: 'roofing') }
  let(:wood) { FactoryBot.create(:material) }
  let(:carpet) { FactoryBot.create(:material, name: 'carpet') }
  let(:wood_flooring) { FactoryBot.create(:product, category: flooring, material: wood) }
  let(:carpet_flooring) { FactoryBot.create(:product, category: flooring, material: carpet) }
  let(:wood_roofing) { FactoryBot.create(:product, category: roofing, material: wood) }
  let(:wood_flooring_partner) { FactoryBot.create(:partner, products: [wood_flooring], street: "Marienstraße 7", city: "Erlangen", country: "Deutschland") }
  let(:flooring_partner) { FactoryBot.create(:partner, products: [carpet_flooring, wood_flooring], street: "Schleifweg 2", city: "Roth", country: "Deutschland") }
  let(:wood_roofing_partner) { FactoryBot.create(:partner, products: [wood_roofing]) }
end
