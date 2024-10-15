class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :join_code
      t.datetime :join_code_expiry
      t.datetime :join_code_sent_at
      t.timestamps
    end
  end
end
