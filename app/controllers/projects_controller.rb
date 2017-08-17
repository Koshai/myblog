class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destory]
  def index
    @projects = Project.all.order("created_at desc")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project, notice: "Woot! Your project has been saved!"
    else
      render 'new'
    end
  end

  def show
  end

  def find_project
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end
end
