class AddDefualtDateToTransaction < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
