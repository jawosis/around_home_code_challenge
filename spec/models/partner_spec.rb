require 'rails_helper'
require 'shared_models'
require 'shared_context'

RSpec.describe Partner, type: :model do
  include_context "partners"

  let(:addressable) { wood_roofing_partner }

  it_behaves_like 'addressable'

  describe 'scope' do
    context 'for_product' do
      before do
        wood_flooring_partner
        flooring_partner
        wood_roofing_partner
      end

      it 'returns correct items' do
        expect(described_class.for_product(wood_flooring.id).map(&:id)).to eq([wood_flooring_partner.id, flooring_partner.id])
      end
    end

    context 'experienced_with_category' do
      let(:project1) { FactoryBot.create(:project, partner: wood_flooring_partner, product: wood_flooring) }
      let(:project2) { FactoryBot.create(:project, partner: flooring_partner, product: carpet_flooring) }
      let(:project3) { FactoryBot.create(:project, partner: wood_roofing_partner, product: wood_roofing) }

      before do
        project1
        project2
        project3
      end

      it 'returns correct items' do
        expect(described_class.experienced_with_category(flooring.id).map(&:id)).to eq([project1.id, project2.id])
      end
    end
  end
end
