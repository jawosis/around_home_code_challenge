class ProjectsController < ApplicationController
  before_action :ensure_project

  def recommended_partners
    data = project.recommended_partners.map { |el| el.attributes.slice('id', 'name', 'email', 'phone', 'street', 'city', 'avg_rating') }

    render json: { data: data }
  end

  private

  def project
    @project ||= Project.find_by(id: permitted_params[:project_id].to_i)
  end

  def ensure_project
    project || not_found
  end

  def permitted_params
    params.permit(:project_id)
  end
end
