class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions.all
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
