class Api::V1::ServicesController < Api::V1::BaseController
  respond_to :json

  before_filter :authenticate_user!

  def_param_group :service do
    param :name, String, desc: 'the name of the service', required: true, action_aware: true 
    param :auto_resolve_timeout, Fixnum, desc: 'timeout in minutes after which any triggered incidents will auto-resolve ', required: true, action_aware: true
    param :acknowledge_timeout, Fixnum, desc: 'timeout in minutes that any acknowledged incidents will re-trigger', required: true, action_aware: true
    param :escalation_policy_id, String, desc: 'the id of the escalation policy associated with the service', required: true, action_aware: true
  end

  api :GET, '/services', 'List all services'
  def index
    @services = current_account.services

    respond_with @services
  end

  api :GET, '/services/:id', 'Show a service'
  param :id, String, desc: 'The incident id', required: true
  def show
    @service = current_account.services.where(uuid: params[:id]).first

    respond_with @service
  end

  api :POST, '/services', 'Create a service'
  param_group :service
  def create
    @escalation_policy = current_account.escalation_policies.where(uuid: params.delete(:escalation_policy_id)).first
    @service = current_account.services.new(service_params.merge(:escalation_policy => @escalation_policy))
    @service.save

    respond_with @service
  end

  api :PUT, '/services/:id', 'Update a service'
  param :id, String, desc: 'the id of the service', required: true
  param_group :service
  def update
    @service = current_account.services.where(uuid: params[:id]).first
    @service.update_attributes(service_params)

    respond_with @service, json: @service
  end

  def enable
    @service = current_account.services.where(uuid: params[:id]).first
    @service.enable && hound_action(@service, 'enable')

    respond_with @service, json: @service
  end

  def disable
    @service = current_account.services.where(uuid: params[:id]).first
    @service.disable && hound_action(@service, 'disable')

    respond_with @service, json: @service
  end

  api :DELETE, '/services/:id', 'Delete a service'
  param :id, String, desc: 'the id of the service', required: true
  def destroy
    @service = current_account.services.where(uuid: params[:id]).first
    @service.destroy

    respond_with @service
  end

  private

  def service_params
    params.permit(:name, :auto_resolve_timeout, :acknowledge_timeout)
  end
end
