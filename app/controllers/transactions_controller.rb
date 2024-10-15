class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    if index_params
      @month = params[:month].to_i
      @year = params[:year].to_i
      @transactions = @group.transactions.where(date: Date.new(@year, @month, 1)..Date.new(@year, @month, -1))

    else
      redirect_to transactions_path(month: Date.today.month, year: Date.today.year)
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = @group.transactions.new(transaction_params)
    if @transaction.save
      redirect_to group_transaction_url(id: @transaction.id), notice: 'Transaction created successfully'
    else
      redirect_back fallback_location: root_path, notice: 'Transaction creation failed'
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id]) if params[:group_id].present?
  end

  def transactions(month, year)
  end

  def index_params
    params[:month].present? && params[:year].present? && params[:month].to_i.between?(1,
                                                                                      12) && params[:year].to_i.positive?
  end

  def transaction_params
    params.require(:transaction).permit(:title, :description, :amount, :date).merge(user_id: current_user.id)
  end
end
