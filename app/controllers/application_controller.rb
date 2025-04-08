class ApplicationController < ActionController::Base
  # set_current_tenant_by_subdomain_or_domain(:organization, :subdomain, :domain)
  set_current_tenant_through_filter
  before_action :set_tenancy_organization

  # before_action do 
  #   binding.irb
  # end

  # before_action :set_tenancy_organization
  before_action :configure_permitted_parameter_fields, if: :devise_controller?

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  def stripe_payment; end

  protected

  def set_tenancy_organization
    @organizations = Organization.all

    @organization = Organization.first
    @org_name = @organization.blank? ? "No Organization" : @organization.name

    Organization.where(active_org: true).each do |org|
      @org_active = org
    end

    @org_active_name = @org_active.blank? ? "No Organization" : @org_active.name

    set_current_tenant(@org_active)

  end

  def configure_permitted_parameter_fields
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :organization_id, :avatar, :username, images: [] ])    # new
    devise_parameter_sanitizer.permit(:account_update, keys: [ :organization_id, :avatar, :username, images: [] ])   # edit
  end
end
