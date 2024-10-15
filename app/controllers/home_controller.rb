class HomeController < ApplicationController
  def index
    month = Date.today.month
    year = Date.today.year
    @transactions = current_user.transactions.where(date: Date.new(year, month, 1)..Date.new(year, month, -1))
  end
end
