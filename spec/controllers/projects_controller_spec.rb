require 'rails_helper'
require 'shared_context'

RSpec.describe ProjectsController, type: :controller do
  include_context "partners"

  let(:open_project) { FactoryBot.create(:project, product: wood_flooring ) }
  let(:project1) { FactoryBot.create(:project, product: wood_flooring, partner: wood_flooring_partner) }
  let(:params) { { project_id: open_project.id } }

  describe 'recommended_partners' do
    context 'without a matching project' do
      let(:params) { { project_id: 999 } }

      it 'returns a 404' do
        get :recommended_partners, params: params.as_json
        expect(response.status).to eq(404)
      end
    end

    context 'with a matching project' do
      before do
        project1
      end

      it 'returns correct data' do
        get :recommended_partners, params: params.as_json
        expected = wood_flooring_partner.attributes.slice('id', 'name', 'email', 'phone', 'street', 'city', 'avg_rating')
          .merge('avg_rating' => wood_flooring_partner.avg_rating.to_s)
        expect(JSON.parse(response.body)["data"].first).to eq(expected)
      end
    end
  end
end
