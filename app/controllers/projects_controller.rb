class ProjectsController < ApplicationController
  before_action :set_tenancy_organization
  # before_action :authenticate_user!

  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ show edit update destroy new create ]
  before_action :verify_organization

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    # debugger
    @user_plan = Plan.find(current_user.plan_id)

    # debugger
    # Update the filename of the associated blob
    # 'key' to change cloud storage name
    # f_org_name = @org_active.name
    # f_key = @project.image.blob.key
    # @project.image.blob.update(key: "#{f_org_name}/#{f_key}")

    respond_to do |format|
      if @project.save
        format.html { redirect_to [ @org_active, @project ], notice: "Project was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    # debugger
    # Update the filename of the associated blob
    # # 'key' to change cloud storage name
    # f_org_name = @org_active.name
    # f_key = @project.image.blob.key
    # @project.image.blob.update(key: "#{f_key}")

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to [ @org_active, @project ], notice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to organization_projects_path(@org_active), status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_user
      @this_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:project_id, :name, :details, :expected_completion_date, :organization_id, :user_id, :image)
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    def verify_organization
      # debugger
      unless params[:organization_id].to_i == @org_active.id
        # redirect_to organization_projects_path(@org_active)
        redirect_to organization_projects_path(@org_active), flash: { error: "You are not authorized to access this organization." }
      end
    end
end
