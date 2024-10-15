class AddTypeToGroup < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :group_type, :integer, default: 0
  end
end
