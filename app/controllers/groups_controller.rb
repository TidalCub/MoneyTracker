class GroupsController < ApplicationController
  before_action :authenticate_user!
  def join
    @group = Group.where(join_code: params[:code]).where('join_code_expiry > ?', Time.now).first
    redirect_to root_path, alert: 'Invalid or expired join code' and return unless @group.present?

    @group.users << current_user
    redirect_to group_transactions_path(@group), notice: 'You have joined the group.'
  end

  def generate_join_code
    @group = Group.find(params[:id])
    @group.update(join_code: SecureRandom.hex(3), join_code_expiry: 2.hour.from_now)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @group, notice: 'Join code generated.' }
    end
  end

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
