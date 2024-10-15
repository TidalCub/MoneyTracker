class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:month].present?
      month = params[:month].to_i
      @transactions = current_user.transactions.where(date: Date.new(Date.today.year, month,
                                                                     1)..Date.new(Date.today.year, month, -1))
    else
      redirect_to transactions_path(month: Date.today.month)
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction, notice: 'Transaction created successfully'
    else
      redirect_back fallback_location: root_path, notice: 'Transaction creation failed'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:title, :description, :amount, :date).merge(user_id: current_user.id)
  end
end
