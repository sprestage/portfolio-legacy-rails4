class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project was successfully created."
      redirect_to @project
    else
      render :new
    end
  end
end
