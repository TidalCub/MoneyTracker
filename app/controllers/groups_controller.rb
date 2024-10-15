class GroupsController < ApplicationController
  def show
  end

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << current_user
      redirect_to @group, notice: 'Group was successfully created.'
    else
      redirect_back fallback_location: root_path,
                    alert: "Group could not be created: #{@group.errors.full_messages.join(',')}"
    end
  end

  def update
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
