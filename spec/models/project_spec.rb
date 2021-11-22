require 'rails_helper'
require 'shared_context'

RSpec.describe Project, type: :model do
  include_context "partners"

  let(:project) { FactoryBot.create(:project, product: wood_roofing) }

  describe 'instance method' do
    describe 'set_category' do
      it 'is triggered on save' do
        expect(project).to receive(:set_category)
        project.save!
      end

      it 'sets correct category' do
        project.product = wood_roofing
        project.send(:set_category)
        expect(project.category).to eq(roofing)
      end
    end

    describe 'recommended_partners' do
      let(:wood_flooring_partner2) { FactoryBot.create(:partner, products: [wood_flooring], street: "Marienstraße 7", city: "Erlangen", country: "Deutschland", avg_rating: 3.00) }
      let(:flooring_partner2) { FactoryBot.create(:partner, products: [carpet_flooring, wood_flooring], street: "Medienallee 7", city: "Unterföhring", country: "Deutschland", avg_rating: 5.00) }
      let(:project1) { FactoryBot.create(:project, product: wood_flooring, partner: wood_flooring_partner) }
      let(:project2) { FactoryBot.create(:project, product: wood_flooring, partner: wood_flooring_partner2) }
      let(:project3) { FactoryBot.create(:project, product: carpet_flooring, partner: flooring_partner) }
      let(:project4) { FactoryBot.create(:project, product: carpet_flooring, partner: flooring_partner2) }
      let(:project5) { FactoryBot.create(:project, product: wood_roofing, partner: wood_roofing_partner) }
      let(:open_project) { FactoryBot.create(:project, product: wood_flooring ) }

      before do
        project1
        project2
        project3
        project4
        project5
      end

      it 'returns correct ids' do
        expected = [wood_flooring_partner, flooring_partner, wood_flooring_partner2].map(&:id)
        expect(open_project.recommended_partners.map(&:id)).to eq(expected)
      end
    end
  end
end
