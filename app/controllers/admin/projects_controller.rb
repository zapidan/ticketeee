class Admin::ProjectsController < Admin::ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
      # redirect_to @project, flash: { success: "Project has been created." }
      # redirect_to @project, success: "Project has been created." }
    else
      flash.now[:alert] = "Project has not been created."
      # current page load
      render "new"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path, notice: "Project has been deleted."
  end

  private
  
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
