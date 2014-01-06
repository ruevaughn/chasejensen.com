class Api::GeneratorController < Api::ApplicationController
  include ApplicationHelper
  def preview
    md = markdown(params[:body])
    render json: { preview: md }
  end
end
