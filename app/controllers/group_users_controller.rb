class GroupUsersController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    current_user.join(group)
    redirect_to request.referrer || root_path
  end

  def destroy
    group = Group.find(params[:id])
    current_user.leave_group(group)
    redirect_to request.referrer || root_path
  end
end
