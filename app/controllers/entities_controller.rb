class EntitiesController < ApplicationController
  before_action :require_login
  def index
    @group = Group.find(params[:group_id])
    @group_entities = Entity.where(group: @group).order(created_at: desc)
  end

  def new
    @new_entity = Entity.new
    @user_groups = Group.where(user: current_user)
  end

  def create
    @new_entity = Entity.new(entity_params)
    return unless @new_entity.save

    flash[:success] = 'Entity Created successfully'
    redirect_to group_entities_path(entity_params[:group_id])
  end

  def destroy
    @transaction = Entity.find(params[:id])

    return unless @transaction.destroy

    flash[:success] = 'Transaction deleted successfully.'
    redirect_to group_entities_path(params[:group_id])
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :author_id, :group_id)
  end
end
