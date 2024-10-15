class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if index_params
      @month = params[:month].to_i
      year = params[:year].to_i
      @transactions = current_user.transactions.where(date: Date.new(year, @month, 1)..Date.new(year, @month, -1))
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
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction, notice: 'Transaction created successfully'
    else
      redirect_back fallback_location: root_path, notice: 'Transaction creation failed'
    end
  end

  private

  def index_params
    params[:month].present? && params[:year].present? && params[:month].to_i.between?(1,
                                                                                      12) && params[:year].to_i.positive?
  end

  def transaction_params
    params.require(:transaction).permit(:title, :description, :amount, :date).merge(user_id: current_user.id)
  end
end
