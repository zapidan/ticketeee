class API::TicketsController < API::ApplicationController
  attr_reader :current_user
  before_action :set_project

  def show
    @ticket = Ticket.find(params[:id])
    authorize @ticket, :show?
    render json: @ticket
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end
end
