class AddGroupToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :group, null: true, foreign_key: true
  end
end
