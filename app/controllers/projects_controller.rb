class ProjectsController < ApplicationController

  before_action :find_project, only: [:edit, :update, :show, :delete]
  before_action :set_selected_tab
  before_action :redirect_if_access_denied, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_path
  end

  def edit
  end

  def show
  end

  def update
    @project = @project.update_attributes(project_params)
    redirect_to projects_path
  end

  def delete
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def set_selected_tab
    @selected_tab = { project: :active }
  end

  def project_params
    params.require(:project).permit(:name, :description, :url)
  end

end
